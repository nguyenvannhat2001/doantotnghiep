
@extends('admin.theme.layout')
@section('content')
<div id="content">
    @if(Session::has('message'))
    <div class="alert alert-success">
      {{ Session::get('message') }}
    </div>
    @endif
    <div class="btn-group" role="group" aria-label="Basic example">
        <a href="{{ url(Request::route()->getPrefix()) }}" class="btn btn-primary">Quản lý</a>
        
    </div>
</div>
<table class="table table-hover">
      <thead>
        <th>Name</th>
        <th>Email</th>
        <th >Password</th>
        
      </thead>
      <tbody>
        @foreach($users ?? '' as $user)
          <tr>
            <td>{{$user->name}} </td>
            <td>{{$user->email}} </td>
            <td>{{$user->password}} </td>
            
        @endforeach
      </tbody>
  </table>
@stop
