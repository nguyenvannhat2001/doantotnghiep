<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\Commet;
use App\Models\Slide;
use App\Models\Bill;
use App\Models\Bill_detail;
use App\Models\Customer;
use App\Models\User;
use App\Models\Cart;
use App\Models\Cart_detail;
use App\Models\NguoiDung;
use App\Login;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Auth;
use Session;

class PageController extends Controller
{
    //
    public function getIndex(){
        $user = Auth::user();
        $isUser = '';
        if ($user) {
            $isUser = ( $user->trangthai == 'active' && $user->loaitaikhoan == 'admin' ) ? $user->loaitaikhoan : '';
        }

        $new_product = Product::where('new',1)->orderBy('id','desc')->paginate(8);
        $sanpham_khuyenmai = Product::where('discount','<>',0)->paginate(4);
        return view('users.page.trangchu',compact('new_product','sanpham_khuyenmai','isUser'));
    }

    public function getLoaiSp($type){
        $sp_theoloai = Product::where('idcat',$type)->get();
        $sp_khac = Product::where('idcat','<>',$type)->paginate(3);
        $loai = Category::all();
        $loai_sp = Category::where('id',$type)->first();
    	return view('users.page.loai_sanpham',compact('sp_theoloai','sp_khac','loai','loai_sp'));
    }

    public function getChitiet(Request $req,$id){
        $sanpham = Product::where('id',$req->id)->first();
        $data=Commet::where('id_com',$id)->get();
        $sp_tuongtu = Product::where('idcat',$sanpham->id_type)->paginate(6);
    	return view('users.page.chitiet_sanpham',compact('sanpham','sp_tuongtu','data'));
    }


    public function postComment(Request $request,$id)
    {
       $comment=new Commet;
       $comment->name=$request->name;
       $comment->email=$request->email;
       $comment->content=$request->content;
       $comment->id_com=$id;
       $comment->save();
       return back();
    }
    public function getLienHe(){
    	return view('users.page.lienhe');
    }

    public function getGioiThieu(){
    	return view('users.page.gioithieu');
    }

    public function getGioHang(){
        return view('users.page.giohang');
    }

    public function getAddtoCart(Request $req,$id){
        $product = Product::find($id);
        if (empty($product)) {
            return redirect()->back()->with('thongbao','Không tìm thấy sản phẩm');
        }
        if ($product->hang_ton_kho == 0) {
            return redirect()->back()->with('thongbao','Sản phẩm đã hết hàng');
        }
        $cart = Cart::where('user_id',Auth::user()->id)->first();
        if ($cart) {
            $cart->tongtien += $product->price;
            $cart->save();
        } else {
            $cart = new Cart;
            $cart->tongtien = $product->price;
            $cart->discount = !empty($req->discount) ? $req->discount : 0;
            $cart->user_id = Auth::user()->id;
            $cart->save();
        }

        $cart_detail = Cart_detail::where('cart_id',$cart->id)->where('product_id',$product->id)->first();

        if ($cart_detail) {
            $cart_detail->quantity += !empty($req->soluong) ? $req->soluong : 1;
            $cart_detail->save();
        } else {
            $cart_detail = new Cart_detail;
            $cart_detail->cart_id = $cart->id;
            $cart_detail->product_id = $product->id;
            $cart_detail->quantity = !empty($req->soluong) ? $req->soluong : 1;
            $cart_detail->save();
        }
        // $product->hang_ton_kho = $product->hang_ton_kho > 0 ? $product->hang_ton_kho - $req->soluong : 0;
        $product->save();
        return redirect()->back()->with('thongbao','Đặt hàng thành công');
    }
    public function postAddtoCart(Request $req,$id){
        $product = Product::find($id);
        $cart = Cart::where('user_id',Auth::user()->id)->first();
        if ($cart) {
            $cart->tongtien += ($req->soluong) * $product->price;
            $cart->save();
        } else {
            $cart = new Cart;
            $cart->tongtien = ($req->soluong) * $product->price;
            $cart->discount = !empty($req->discount) ? $req->discount : 0;
            $cart->user_id = Auth::user()->id;
            $cart->save();
        }

        $cart_detail = Cart_detail::where('cart_id',$cart->id)->where('product_id',$product->id)->first();
        if ($cart_detail) {
            $cart_detail->quantity += !empty($req->soluong) ? $req->soluong : 1;
            $cart_detail->save();
        } else {
            $cart_detail = new Cart_detail;
            $cart_detail->cart_id = $cart->id;
            $cart_detail->product_id = $product->id;
            $cart_detail->quantity = !empty($req->soluong) ? $req->soluong : 1;
            $cart_detail->save();
        }

        // $product->hang_ton_kho = $product->hang_ton_kho > 0 ? $product->hang_ton_kho - $req->soluong : 0;
        $product->save();
        return redirect()->back()->with('thongbao','Đặt hàng thành công');
    }


    public function getDelItemCart($id){
        $oldCart = Session::has('cart')?Session::get('cart'):null;
        $cart = new Cart($oldCart);
        $cart->removeItem($id);
        if(count($cart->items)>0){
            Session::put('cart',$cart);
        }
        else{
            Session::forget('cart');
        }
        return redirect()->back();
    }

    public function getCheckout(){
        $user = Auth::user(); // Thông tin user đang đăng nhập
        return view('users.page.dat_hang',compact('user'));
        // return view('users.page.dat_hang');
    }



    public function postCheckout(Request $req){
        $cart = Cart::where('user_id',Auth::user()->id)->first();
        if ($cart) {
            $customer = Customer::where('id',Auth::user()->id)->first();
            if (empty($customer)) {
                $customer = new Customer;
                $customer->name = $req->name;
                $customer->gender = $req->gender;
                $customer->email = $req->email;
                $customer->address = $req->address;
                $customer->phone_number = $req->phone;
                $customer->note = $req->notes;
                $customer->save();
            } else {
                $customer->name = $req->name;
                $customer->gender = $req->gender;
                $customer->email = $req->email;
                $customer->address = $req->address;
                $customer->phone_number = $req->phone;
                $customer->note = $req->notes;
                $customer->save();
            }

            $bill = new Bill;
            $bill->id_customer = $customer->id;
            $bill->date_order = date('Y-m-d');
            $bill->total = $cart->tongtien;
            $bill->payment = $req->payment_method;
            $bill->note = $req->notes;
            $bill->status = 0;
            $bill->save();

            $cart_details = Cart_detail::where('cart_id',$cart->id)->get();
            if (!empty($cart_details->toArray())) {
                foreach ($cart_details as $cart_detail) {
                    $product = Product::find($cart_detail->product_id);
                    $bill_detail = new Bill_detail;
                    $bill_detail->id_bill = $bill->id;
                    $bill_detail->id_products = $cart_detail->product_id;
                    $bill_detail->quantity = $cart_detail->quantity;
                    $bill_detail->price = $product->price;
                    $bill_detail->save();
                    $cart_detail->delete();
                }
            }
            $cart->delete();
        }

        // return redirect()->back()->with('thongbao','Đặt hàng thành công');
        return redirect()->route('trang-chu')->with('thongbao','Đặt hàng thành công');

    }

    public function getLogin(){
        return view('users.page.dangnhap');
    }
    public function getSignin(){
        return view('users.page.dangky');
    }

    public function getSearch(Request $request){
        $query = Product::query();

    if ($request->name) {
        $query->where('name', 'like', '%' . $request->name . '%');
    }

    if ($request->min_price) {
        $query->where('price', '>=', $request->min_price);
    }

     if ($request->max_price) {
        $query->where('price', '<=', $request->max_price);
    }

    $product = $query->get();
        return view('users.page.search',compact('product'));

    }

    public function postSignin(Request $req){
        $this->validate($req,
            [   'diachi'=>'required',
                'dienthoai'=>'required',
                'email'=>'required|email|unique:users,email',
                'password'=>'required|min:6|max:20',
                'name'=>'required',
                're_password'=>'required|same:password'
            ],
            [
                'email.required'=>'Vui lòng nhập email',
                'email.email'=>'Không đúng định dạng email',
                'password.required'=>'Vui lòng nhập mật khẩu',
                're_password.same'=>'Mật khẩu không giống nhau',
                'password.min'=>'Mật khẩu ít nhất 6 kí tự'
            ]);
        $user = new User();
        $user->name = $req->name;
        $user->email = $req->email;
        $user->password = Hash::make($req->password);
        $user->dienthoai = $req->dienthoai;
        $user->diachi = $req->diachi;
        $user->trangthai = 'unactive';
        $user->loaitaikhoan = 'user';
        $user->save();
        // return redirect()->back()->with('thanhcong','Tạo tài khoản thành công');
        $login = new Request([
            'email' => $user->email, 
            'password' => $req->password
        ]);
        return $this->postLogin($login);
        // if (Auth::attempt($login)) {
        //     // return redirect('/')->with('name');
        // } else {
        //     return redirect()->back()->with('status', 'Tạo tài khoản không thành công');
        // }
        
    }

    public function postLogin(Request $request){
        $login = [
            'email' => $request->email,
            'password' => $request->password,
            //'trangthai'   =>"active"
        ];
        if (Auth::attempt($login)) {
            $user = Auth::user();
            if ($user->loaitaikhoan == 'admin') {
                return redirect()->route('welcome'); // Trang admin
            } else {
                return redirect()->route('trang-chu'); // Trang người dùng
            }
        } else {
            return redirect()->back()->with('status', 'Email hoặc Password không chính xác');
        }

    }
    public function postLogout(){
        Auth::logout();
        return redirect()->route('trang-chu');
    }

    public function getDonHang()
    {
        $user = Auth::user();
        $donhang = '';
        $hd = [];
        // if ($user) { // $user->trangthai == 'active'
            // $donhang =Customer::all();
            $customers = Customer::where('email', $user->email)->get();
            $customer_ids = Customer::select('id')->where('email', $user->email)->get()->toArray();
            $cus_ids = [];
            foreach ($customer_ids as $id) {
                $cus_ids[] = $id['id'];
            }
            $bills = Bill::whereIn('id_customer',$customer_ids)->get();
            $donhang = [];
            foreach ($bills as $bill) {
                $custumer = Customer::where('id', $bill->id_customer)->first();
                $bill['name'] = $custumer->name;
                $bill['address'] = $custumer->address;
                $bill['phone_number'] = $custumer->phone_number;
                $bill['created_at'] = $custumer->created_at;
                $donhang[] = $bill;
            }
            // $hd=Bill_detail::all();
            // $bills = Bill::where('id_customer',$user->id)->get();
            // dd($bills);
        // }
        return view('users.page.donhang',compact('donhang','hd'));
    }
}
