@extends('admin.theme.layout')
@section('content')
<h3>Chi tiết hóa đơn</h3>
<div class="form-group">
    <label for="name">Tên khách hàng:</label>
    <span class="">{{ $customer->name ?? 'Không có dữ liệu' }}</span>
</div>
<div class="form-group">
    <label for="email">Địa chỉ:</label>
   <span class="">{{ $customer->email ?? 'Không có dữ liệu' }}</span>
</div>
<div class="form-group">
    <label for="pwd">Số điện thoại:</label>
    <span>{{$customer->phone_number     ?? 'Không có dữ liệu'}}</span>
</div>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Giá</th>
        </tr>
    </thead>    
    <tbody>
        @foreach ($products as $product)
        <tr>
            <td>{{$product->name}}</td>
            <td>{{$product->quantity}}</td>
            <td>{{number_format($product->price)}} </td>
        </tr>
        @endforeach
    </tbody>
</table>

<a href="{{route('hoadon')}}" type="button" name="btnregister" class="btn btn-primary">Quay lại</a>
@stop