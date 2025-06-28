<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Bill;
use App\Models\Bill_detail;
use App\Models\Customer;
use App\Models\Product;
use Illuminate\Http\Request;

class HoaDonController extends Controller
{


  public function index(request $request)
  {
    $hoadon = Bill::with('customer')->get(); // Lấy tất cả hóa đơn
    return view('admin.hoadon.index', compact('hoadon'));
  }
  public function getEdit($id)
  {
    $hoadon = Bill::find($id); // Lấy hóa đơn
    $customer = Customer::find($hoadon->id_customer); // Lấy thông tin khách hàng
    $bill_details = Bill_detail::select('id_products','quantity')->where('id_bill',$id)->get()->toArray(); // Lấy danh sách id sản phẩm (product) của bill hiện tại
    $id_products = array();
    $quantities = array();

    foreach ($bill_details as $bill_detail) {
      $id_products[] = $bill_detail['id_products'];
      $quantities[$bill_detail['id_products']] = $bill_detail['quantity'];
    } // => $id_products = [47, 48]; $quantities = [47=>1, 48=>2];

    $productsOfBill = Product::whereIn('id',$id_products)->get(); // Lấy thông tin danh sách sản phẩm của bill hiện tại

    $products = array();
    foreach ($productsOfBill as $product) {
      $product_id = $product->id; 
      if (!empty($quantities[$product_id])) {
        $product['quantity'] = $quantities[$product_id];
      }
      $products[] = $product;
    }

    return view('admin.hoadon.edit', compact('hoadon','customer','products'));
  }

  public function approve($id) {
    $bill = Bill::find($id);

    $bill_details = Bill_detail::select('id_products','quantity')->where('id_bill',$id)->get()->toArray(); // Lấy danh sách id sản phẩm (product) của bill hiện tại
    $id_products = array();

    foreach ($bill_details as $bill_detail) {
      $id_products[$bill_detail['id_products']] = $bill_detail['quantity'];
    }
    foreach ($id_products as $id => $quantity) {
      $product = Product::find($id);
      $product->hang_ton_kho = ($product->hang_ton_kho >= $quantity && $product->hang_ton_kho >= 0) ? $product->hang_ton_kho - $quantity : 0;
      $product->save();
    }
    $bill->status = 1;
    $bill->save();
    return redirect()->route('hoadon');

  }

  public function delete($id) {
    Bill::find($id)->delete();
    Bill_detail::where('id_bill',$id)->delete();
    return redirect()->route('hoadon');
  }
}
