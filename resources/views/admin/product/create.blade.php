@extends('admin.theme.layout')
@section('content')
<form action="{{route('product.store')}}" method="POST" enctype="multipart/form-data">
    {{ csrf_field() }}
    <div class="form-group">
     <label for="idcat">Category:</label>
        <select name="idcat" class="form-control">
            <option value=''>---Vui lòng chọn danh mục sản phẩm---</option>>
            @foreach ($category as $key =>$cat)
            <option value="{{$cat->id}}">{{($key+1).'. '.$cat->name}}</option>
            @endforeach
        </select>
   </div>
    <div class="form-group">
     <label for="name">Tên sản phẩm:</label>
     <input type="text" class="form-control" name="name">
   </div>
   <div class="form-group">
     <label for="image">Ảnh:</label>
     <input type="file" class="form-control"name="image" value=""multiple />
   </div>
   <div class="form-group">
    <label for="price">Giá:</label>
    <input type="text" class="form-control"name="price">
  </div>
  <div class="form-group">
    <label for="discount">Giảm:</label>
    <input type="text" class="form-control"name="discount">
  </div>
  <div class="form-group">
    <label for="content">Mô tả:</label>
    <textarea class="form-control" id="des" name="description"></textarea>
    <script>CKEDITOR.replace('des');</script>
  </div>
  <div class="form-group" >
    <label>Bảo Hành</label>
    <select name="baohanh" class="form-control">
         <option name="baohanh">12 Tháng</option>
         <option name="baohanh">24 Tháng</option>
   </select>
</div>
  <div class="form-group">
    <label for="content">Content:</label>
    <textarea class="form-control" name="content" id="con"></textarea>
    <script>CKEDITOR.replace('con');</script>
  </div>
<div class="form-group">
    <label for="hang_ton_kho">Hàng tồn kho:</label>
    <input type="number" class="form-control" name="hang_ton_kho" min="0" />
</div>
  <div class="form-group">
    <label for="trangthai">Trạng thái:</label>
    <select class="form-control" name="trangthai">
        <option value="còn hàng">Hiển thị</option>
        <option value="hết hàng">Ẩn</option>
    </select>
</div>
<div class="form-group">
    <label for="new">new:</label>
    <select class="form-control" name="new">
        <option value="1">Mới</option>
        <option value="0">Cũ</option>
    </select>
</div>
   <button type="submit" name="btn_addproduct"class="btn btn-primary">Thực Hiện</button>
 </form>
 </div>
 @stop
