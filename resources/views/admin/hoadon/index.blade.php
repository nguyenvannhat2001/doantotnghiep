@extends('admin.theme.layout')
@section('content')

<div class="container mt-4">
    <h3>Danh sách hóa đơn</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Khách hàng</th>
                <th>Ngày đặt</th>
                <th>Ghi chú</th>
                <th>Thanh toán</th>
                <th>Chức năng</th>
            </tr>
        </thead>
        <tbody>
            @foreach($hoadon as $bill)
            <tr>
                <td>{{ $bill->id }}</td>
                <td>{{ $bill->customer->name ?? 'Không rõ' }}</td>
                <td>{{ $bill->date_order }}</td>
                <td>{{ number_format($bill->total) }} đ</td>
                <td>{{ $bill->payment }}</td>
                <td class="d-flex align-items-center justify-content-center">
                    <a href="{{route('chitiethoadon',$bill->id)}}" class="btn" type="button">
                        <i class="fa fa-eye"></i>
                    </a>
                    @if($bill->status == 0)
                    <a href="{{route('duyethoadon',$bill->id)}}" class="btn" type="button">
                        <i class="fa fa-check"></i>
                    </a>
                    @endif
                     <a href="{{route('xoahoadon',$bill->id)}}" class="btn" type="button">
                        <i class="fa fa-trash"></i>
                    </a>
                <td>
            </tr>
            @endforeach
        </tbody>
    </table>
    </div>
@endsection