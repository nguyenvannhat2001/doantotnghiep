<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $table='product';
    protected $fillable = [
        'name',
        'image',
        'price',
        'discount',
        'description',
        'baohanh',
        'trangthai',
        'new',
        'content',
        'idcat',
        'hang_ton_kho',
    ];
    public function category(){
        return $this->belongsTo('App\Models\Category', 'idcat', 'id');
    }
    public function bill_detail(){
    	return $this->hasMany('App\BillDetail','id_product','id');
    }
    public function images()
    {
    return $this->hasMany(ProductImage::class);
    }
}
