@extends('users.layout')
@section('title','Giỏ Hàng')
@section('content')
    <div class="">
        <div class="span9">
            <h4 class="title" style="text-align: center"><span class="text"><strong>Giỏ Hàng</strong> Của Bạn </span></h4>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th> Tên Sản Phẩm </th>
                        <th>Hình </th>
                        <th> Giá Tiền </th>
                        <th>Delete</th>

                    </tr>
                </thead>
                <tbody>
                    @if (!empty($product_cart))
                    @foreach($product_cart as $product)
                    <tr>
                        <td>{{$product['name']}}</td>
                        <td><img alt="" style="height: 250px" src="images/{{$product['image']}}"></td>
                        <!-- <td>{{$product['qty']}}*<span>@if($product['discount']==0){{number_format($product['price'])}} @else {{number_format($product['discount'])}}@endif</td> -->
                        <td>{{$product['quantity']}}*<span>{{number_format($product['price'])}} đồng</span></td>
                            <td>
                                <div class="cart-item">
                                <a href="{{route('xoagiohang',$product['id'])}}"><i class="
                                    fa fa-trash" style="text-align: center; font-size:20px"></i></a>
                            </div>
                            </div>
                            </div>
                            </td>
                    </tr>
                    @endforeach
                    @endif
                    <td>Tổng Tiền: &emsp;<strong>@if(!empty($totalPrice)){{number_format($totalPrice)}} @else 0 @endif đồng</strong>  </td>
    
                            
        
                   <td> <a href="{{route('dathang')}}" class="beta-btn primary text-center">Đặt hàng <i class="fa fa-chevron-right"></i></a> &emsp;<a href="{{route('trang-chu')}}" class="beta-btn primary text-center">Tiếp Tục Mua Hàng <i class="fa fa-chevron-right"></i></a></td>
                </tbody>
            </table>
        </div>
    </div>
@endsection
