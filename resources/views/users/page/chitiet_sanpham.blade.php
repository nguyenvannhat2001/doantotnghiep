@extends('users.layout')
@section('title','Chi Tiết Sản Phẩm')
@section('content')
	<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Sản phẩm {{$sanpham->name}}</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('trang-chu')}}">Trang chủ</a> / <span>Thông tin chi tiết sản phẩm</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<div class="container">
		<div id="content">
			<div class="row">
				<div class="col-sm-9">

					<div class="row">
						<div class="col-sm-4">
							<img src="images/{{$sanpham->image}}" height="250px" alt="">
						</div>
						<div class="col-sm-8">
							<div class="single-item-body">
                                <p class="single-item-title"><h2>{{$sanpham->name}}</h2></p>
                                &nbsp;
								<p class="single-item-price"  style="font-size: 20px">
									@if($sanpham->discount==0)
										<span class="flash-sale">Giá: {{number_format($sanpham->price)}} $</span>
									@else
										<span class="flash-del">{{number_format($sanpham->price)}} $</span>
										<span class="flash-sale">{{number_format($sanpham->discount)}} $</span>
									@endif
								</p>
							</div>

							<div class="clearfix"></div>
							<div class="space20">&nbsp;</div>

							<div class="single-item-desc">

                                <p style="color: #1a1d1f; font-size:20px" > Bảo Hành: {{$sanpham->baohanh}}</p>
                            </div>
                            &emsp;
                            <div class="space20" style="font-size: 20px">Trạng Thái:  {{$sanpham->trangthai}}</div>
                            &emsp;
							<div class="single-item-options">

								<form action="{{route('postthemgiohang',$sanpham->id)}}" method="post" id="form-soluong">
									@csrf
									<input required="" type="number" name="soluong" id="soluong" placeholder="Nhập số lượng" value="">
									<!-- <button type="submit" class="add-to-cart"><i class="fa fa-shopping-cart"></i></a> -->
								</form>
								<div class="single-item-desc">

                                <p style="color: #1a1d1f; font-size:20px" > Tồn kho {{$sanpham->hang_ton_kho}}</p>
                            </div>
							<button class="add-to-cart" onclick="addToCart(`{{route('postthemgiohang',$sanpham->id)}}`)"><i class="fa fa-shopping-cart"></i></a>
								<!-- <a class="add-to-cart" href="{{route('themgiohang',$sanpham->id)}}"><i class="fa fa-shopping-cart"></i></a> -->
								<div class="clearfix">

                                </div>
							</div>
						</div>
					</div>

					<div class="space40">&nbsp;</div>
					<div class="woocommerce-tabs">
						<ul class="tabs">
							<li><a href="#tab-description">{!! $sanpham->description !!}</a></li>
						</ul>

						<div class="panel" id="tab-description">
							<p>{!!$sanpham->content !!}</p>
						</div>
					</div>
					<div class="space50">&nbsp;</div>
					<div class="beta-products-list">
						<h4>Thêm hình ảnh sản phẩm</h4>

						<div class="row">
						@foreach($sp_tuongtu as $sptt)
							<div class="col-sm-4">
								<div class="single-item">
									@if($sptt->discount!=0)
										<div class="ribbon-wrapper"><div class="ribbon sale">Sale</div></div>
									@endif
									<div class="single-item-header">
										<a href="product.html"><img src="images/{{$sptt->image}}" alt="" height="150px"></a>
									</div>
									<div class="single-item-body">
										<p class="single-item-title">{{$sptt->name}}</p>
										<p class="single-item-price"  style="font-size: 20px">
											@if($sptt->promotion_price==0)
												<span class="flash-sale">{{number_format($sptt->price)}} $</span>
											@else
												<span class="flash-del">{{number_format($sptt->price)}} $</span>
												<span class="flash-sale">{{number_format($sptt->discount)}} $</span>
											@endif
										</p>
									</div>
									<div class="single-item-caption">
										<a class="add-to-cart pull-left" href="{{route('themgiohang',$sptt->id)}}"><i class="fa fa-shopping-cart"></i></a>
										<a class="beta-btn primary" href="{{route('chitietsanpham',$sptt->id)}}">Chi Tiết <i class="fa fa-chevron-right"></i></a>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						@endforeach
						</div>
						<div class="row">{{$sp_tuongtu->links()}}</div>
					</div> <!-- .beta-products-list -->
				</div>
				<div class="col-sm-3 aside">
					<div class="widget">
						<h3 class="widget-title">Bình Luận</h3>
						<div class="widget-body">
							<div class="beta-sales beta-lists">
                                <form method="post" >
								<div class="media beta-sales-item">

                                <input type="text" name="name" placeholder="Họ tên" value="{{Auth::user()->name}}" >


								</div>
								<div class="media beta-sales-item">

                                    <input type="email" id="email" name="email" value="{{Auth::user()->email}}"  placeholder="expample@gmail.com">
								</div>
								<div class="media beta-sales-item">

                                    <input required type="text" name="content" placeholder="Nhập nội dung bình luận">
								</div>
								<div class="media beta-sales-item">

                                    <button style="width:200px" ctype="submit"name="submit" value="">Bình Luận</button>
                                </div>

                                {{csrf_field()}}
                                </form>
							</div>
						</div>
					</div> <!-- best sellers widget -->
					<div class="widget">
						<h3 class="widget-title">Chi Tiết Bình Luận</h3>
						<div class="widget-body">
							<div class="beta-sales beta-lists" style="font-size: 15px">
                                @foreach($data as $comments)
								<div class="media beta-sales-item">
									<div class="media-body">
                                     <span style="color:rgb(13, 14, 13)"><b>Tên:   {{$comments->name}}</b></span>
									</div>
                                    <span style="color:rgb(14, 13, 13) "><b>Ngày: {{date('d/m/Y H:i',strtotime($comments->create_at))}} </b></span><br/>
                                    <span style="color:rgb(8, 7, 7)"><b>Nội Dung:  {{$comments->content}} </b></span>
								</div>
                                @endforeach
							</div>
						</div>
					</div> <!-- best sellers widget -->
				</div>
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->


<script>
	function addToCart(link) {
		var soluong = document.getElementById('soluong').value;
		var hang_ton_kho = '{{$sanpham->hang_ton_kho}}';
		console.log(soluong, parseInt(hang_ton_kho))
		if (soluong > parseInt(hang_ton_kho)) {
			alert('Hàng tồn kho không đủ');
		} if(soluong<=hang_ton_kho && soluong>0) {
			document.getElementById('form-soluong').submit()	
		}
		if(soluong<=0){
			alert('Số lượng phải lớn hơn 0');
		}
	}
</script>
@endsection
