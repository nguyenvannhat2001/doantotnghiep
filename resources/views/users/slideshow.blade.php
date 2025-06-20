
<div class="fullwidthbanner-container">
	<div class="fullwidthbanner">
		<div class="bannercontainer" style="width:95%"  >
	    <div class="banner">
				<ul>
                @foreach($slide as $slides)
                    <li>
						<img src="resource/slide/{{$slides->image}}"  alt="anh bia 2" />

                    </li>
                    @endforeach
				</ul>
			</div>
		</div>

		<div class="tp-bannertimer"></div>
	</div>
</div>
