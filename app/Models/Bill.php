<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bill extends Model
{
    use HasFactory;
    protected $table = "bills";

    // public function bill_detail(){
    // 	return $this->hasMany('App\BillDetail','id_bill','id');
    // }

    public function bill_detail(){
    	return $this->hasMany(Bill_detail::class,'id_bill','id');
    }

    public function customer()
    {
        return $this->belongsTo(Customer::class, 'id_customer','id');
    }
    public function showOrders()
{
    $donhang = Bill::with('customer')->where('id_customer', auth()->user()->id)->get();
    return view('users.page.donhang', compact('donhang'));
}
public function details()
{
    return $this->hasMany(Bill_detail::class, 'id_bill', 'id');
}
}
