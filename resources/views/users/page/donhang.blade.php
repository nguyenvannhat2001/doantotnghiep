@extends('users.layout')
@section('content')
@section('title','Đơn Hàng')

<table border="1" class="table table-bordered">

    <thead>
        <th>Họ Tên KH</th>
        <th>Địa Chỉ</th>
        <th>SDT</th>
        <th>Ngày Lập</th>
        <th>Tổng tiền</th>
        <th>Tình trạng</th>
    </thead>
      <tbody>
        @foreach($donhang ?? '' as $dh )
          <tr>
            <td>{{$dh->name}} </td>
            <td>{{$dh->address}} </td>
            <td>{{$dh->phone_number}}</td>
            <td>{{$dh->created_at}}</td>
            <td></td>
            <td></td>
          </tr>
        @endforeach
      </tbody>
</table>
@endsection
