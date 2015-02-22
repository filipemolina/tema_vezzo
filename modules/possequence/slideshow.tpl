<div id="sequence-theme">
    <div id="sequence">
		{if $slideOptions.show_arrow}
			<div class="controls">
				<a class="sequence-prev">{l s='Prev' mod='possequence'}</a>
				<a class="sequence-next">{l s='Next' mod='possequence'}</a>
			</div>
		{/if}
        <ul class="sequence-canvas">
              {foreach from=$slides key=key item=slide}
					{if $slide.kind_effect==1}
						<li class="{$slide.animate}" id ="kind_effect{$slide.kind_effect}">
							{if $slide.title1}
								<h2 class ="title">{$slide.title1}</h2>
							{/if}
							{if $slide.title2}
								<h3 class ="subtitle">{$slide.title2}</h3>
							{/if}
							{if $slide.description}
								<div class="intro">
									{nl2br($slide.description)}
								</div>
							{/if}
							{if $slide.bgimage}												
								<img class="slider-bg" src="{$slide.bgimage}" alt="Background Image" />
							{/if}
							{if $slide.image}						
								<img class="model" src="{$slide.image}" alt="Image" />						
							{/if}
							
							{if $slide.link}
								<div class ="link">
									<a href ="{$slide.link}">{l s='Shop now' mod='possequence'}</a>
								</div>
							{/if}
						</li>
					{elseif $slide.kind_effect==2}	
						<li class="{$slide.animate}" id ="kind_effect{$slide.kind_effect}">
							{if $slide.title1}
								<h2 class ="title">{$slide.title1}</h2>
							{/if}
							{if $slide.title2}
								<h3 class ="subtitle">{$slide.title2}</h3>
							{/if}
							{if $slide.description}
								<div class="intro">
									{nl2br($slide.description)}
								</div>
							{/if}
							{if $slide.bgimage}												
							<img class="slider-bg" src="{$slide.bgimage}" alt="Background Image" />
							{/if}
							{if $slide.image}						
								<img class="model" src="{$slide.image}" alt="Image" />						
							{/if}
							
							{if $slide.link}
								<div class ="link">
									<a href ="{$slide.link}">{l s='Shop now' mod='possequence'}</a>
								</div>
							{/if}
						</li>
					{elseif $slide.kind_effect==3}	
						<li class="{$slide.animate}" id ="kind_effect{$slide.kind_effect}">
							{if $slide.title1}
								<h2 class ="title">{$slide.title1}</h2>
							{/if}
							{if $slide.title2}
								<h3 class ="subtitle">{$slide.title2}</h3>
							{/if}
							{if $slide.description}
								<div class="intro">
									{nl2br($slide.description)}
								</div>
							{/if}
							{if $slide.bgimage}												
							<img class="slider-bg" src="{$slide.bgimage}" alt="Background Image" />
							{/if}
							{if $slide.image}						
								<img class="model" src="{$slide.image}" alt="Image" />						
							{/if}
							
							{if $slide.link}
								<div class ="link">
									<a href ="{$slide.link}">{l s='Shop now' mod='possequence'}</a>
								</div>
							{/if}
						</li>
					{elseif $slide.kind_effect==4}	
						<li class="{$slide.animate}" id ="kind_effect{$slide.kind_effect}">
							{if $slide.title1}
								<h2 class ="title">{$slide.title1}</h2>
							{/if}
							{if $slide.title2}
								<h3 class ="subtitle">{$slide.title2}</h3>
							{/if}
							{if $slide.description}
								<div class="intro">
									{nl2br($slide.description)}
								</div>
							{/if}
							{if $slide.bgimage}												
							<img class="slider-bg" src="{$slide.bgimage}" alt="Background Image" />
							{/if}
							{if $slide.image}						
								<img class="model" src="{$slide.image}" alt="Image" />						
							{/if}
							
							{if $slide.link}
								<div class ="link">
									<a href ="{$slide.link}">{l s='Shop now' mod='possequence'}</a>
								</div>
							{/if}
						</li>
					
					{/if}
			{/foreach}
        </ul>
		
		{if $slideOptions.show_navigation}
          <ul class="sequence-pagination">
            {foreach from=$slides key=key item=slide}
             {$count= $count+1}
              <li><a href="javascript:void(0)">{$count} </a></li>
            {/foreach}
        </ul>
		{/if}
        
    </div>
</div>

<script type ="text/javascript">

    //<![CDATA[
     $(document).ready(function(){
    
        var options = {
            autoPlay:  {if $slideOptions.auto_slide != 0}true{else}false{/if}, // auto change slides
            autoPlayDelay: {if $slideOptions.pause_time != ''}{$slideOptions.pause_time}{else}3000{/if},
            pauseOnHover: 	{if $slideOptions.hover != 0}{$slideOptions.hover}{else}false{/if}, 
            hidePreloaderDelay: 500,
            nextButton: true,
            prevButton: true,
            pauseButton: true,
            preloader: true,
            pagination:true,
            hidePreloaderUsingCSS: false,                   
            animateStartingFrameIn: true,    
            navigationSkipThreshold: 750,
            preventDelayWhenReversingAnimations: true,
            customKeyEvents: {
                80: "pause"
            }
        };

        var sequence = $("#sequence").sequence(options).data("sequence");

           
    });
    //]]>

</script>