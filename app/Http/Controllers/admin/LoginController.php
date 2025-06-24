<?php
namespace App\Http\Controllers\admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Auth;
use App\Models\User;

class LoginController extends Controller
{
    public function __construct()
    {

    }
    public function getLogin()
    {
        if (Auth::check()) {
            return redirect('panel');
        } else {
            return view('admin.login');
        }
    }
    public function postLogin(request $request)
    {
        
    $this->validate($request, [
        'email' => 'required|email',
        'password' => 'required',
    ]);

    $credentials = $request->only('email', 'password');

    if (Auth::attempt($credentials)) {

        $user = Auth::user();

        if ($user->loaitaikhoan == 'admin') {
            return redirect()->route('welcome'); // Trang admin
        } else {
            return redirect()->route('trangchu'); // Trang người dùng
        }
    } else {
        return redirect()->back()->withErrors(['email' => 'Email hoặc mật khẩu không đúng']);
    }

    }

    public function getLogout()
    {
        Auth::logout();
        return view('admin.login');
    }

    public function getDangky()
    {

        return view('admin.register');
    }

    public function postDangKy(Request $request)
    {
        $this->validate($request,
        [
            
            'email'=>'required|email|unique:users,email',
            'password'=>'required|min:6|max:20',
            'name'=>'required',
            're_password'=>'required|same:password',
             'loaitaikhoan' => 'required|in:admin,user',
        ],
        [
            'email.required'=>'Vui lòng nhập email',
            'email.email'=>'Không đúng định dạng email',
            'email.unique'=>'Email đã có người sử dụng',
            'password.required'=>'Vui lòng nhập mật khẩu',
            're_password.same'=>'Mật khẩu không giống nhau',
            'password.min'=>'Mật khẩu ít nhất 6 kí tự'
        ]);
    $user = new User();
    $user->name = $request->name;
    $user->email = $request->email;
    $user->password = Hash::make($request->password);
    $user->loaitaikhoan=$request->loaitaikhoan;
    $user->save();
    return redirect()->back()->with('thanhcong','Tạo tài khoản thành công');
    }
}
?>
