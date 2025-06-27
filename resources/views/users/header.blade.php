<div id="header">
    <div class="header-top" style="background-color:  rgb(231, 237, 245)" >
        <div class="container">
            <div class="pull-left auto-width-left">
                <ul class="l-inline ov">
                    <li> <form method="get" id="searchform" action="{{ route('search') }}" style="display: flex; gap: 5px;">
    <input type="text" name="name" placeholder="Tìm theo tên..." style="padding: 5px;">
    <input type="number" name="price" placeholder="Tìm giá nhỏ hơn..." style="padding: 5px; width: 130px;">
    <button class="fa fa-search" name="submit" type="submit" id="searchsubmit"></button>
</form>
                 </li>
                </ul>
            </div>
            <div class="pull-right auto-width-right" style="color:#f1a417">
                <ul class="top-details menu-beta l-inline">
                @if(Auth::check())

                       <li><a style="color:rgb(5, 1, 3)" href="">Xin Chào:{{Auth::user()->name}}</a></li>
                        <li><a href="{{route('logout')}}"><b>Đăng xuất</b></a></li>
                @else
                        <li><a href="{{route('signin')}}"><b>Đăng kí</b></a></li>
                        <li><a href="{{route('login')}}"><b>Đăng nhập</b></a></li>
                @endif

                <li>
                    @if(Auth::check()) 
                    <a href="{{route('giohang')}}">
                    <i class="fa fa-shopping-cart" style="font-size:30px;color:rgb(255, 145, 0)"></i>
                    @if(!empty($product_cart)) 
                    (@if(count($product_cart) > 0){{count($product_cart)}}@else 0 @endif)
                    </a>
                    @else
                     (0)
                    @endif
                   </li>
                   @endif

                   <li><a href="{{route('donhang')}}"><b>Đơn Hàng</b></a></li>

                   @if(!empty($isUser))
                   <li><a href="{{route('welcome')}}"><b>Quản lý</b></a></li>
                   @endif
                </ul>
            </div>

        </div> <!-- .container -->
    </div> <!-- .header-top -->


    <div class="header-bottom" style="background-color: rgb(11, 54, 119)">
        <div class="container">
            <a class="visible-xs beta-menu-toggle pull-right" href="#"><span class='beta-menu-toggle-text'>Menu</span> <i class="fa fa-bars"></i></a>
            <div class="visible-xs clearfix"></div>
            <nav class="main-menu">
                <ul class="l-inline ov">
                    <li><a href="{{route('trang-chu')}}">Trang chủ</a></li>
                    <li><a >Danh Mục Sản Phẩm</a>
                        <ul class="sub-menu">
                            @foreach($loai_sp as $loai)
                            <li><a href="{{route('loaisanpham',$loai->id)}}">{{$loai->name}}</a></li>
                            @endforeach
                        </ul>
                    </li>
                    <li><a href="{{route('gioithieu')}}">Giới thiệu</a></li>
                    <li><a href="{{route('lienhe')}}">Liên hệ</a></li>
                    <li>

                    </li>
                </ul>
                <div class="clearfix"></div>
            </nav>
        </div> <!-- .container -->
    </div> <!-- .header-bottom -->
</div> <!-- #header -->
