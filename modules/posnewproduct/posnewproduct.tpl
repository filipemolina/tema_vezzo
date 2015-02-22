
<div class="pos-new-product">
	<div class="pos-new-product-title title_block"><h4>{l s='New Products' mod='posnewproduct'}</h4></div>
	{if count($products)>1}
	<div class="flexslider carousel">
		<ul class="bxslider">			
			{foreach from=$products item=product name=posNewProducts}
				<li class="newproductslider-item ajax_block_product">
				<div class="product-container" itemscope itemtype="http://schema.org/Product">
				<div class="left-block">
					<div class="product-image-container">
						<a class="product_img_link"	href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
							<img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'large_default')|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" {if isset($homeSize)} {/if} itemprop="image" />
						</a>
						{if isset($quick_view) && $quick_view}
							<a class="quick-view" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}">
								<span>{l s='Quick view'}</span>
							</a>
						{/if}
						
						<div class="button-container">
						{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
							{if ($product.allow_oosp || $product.quantity > 0)}
								{if isset($static_token)}
									<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}">
										<span>{l s='Add to cart'}</span>
									</a>
								{else}
									<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}">
										<span>{l s='Add to cart'}</span>
									</a>
								{/if}						
							{else}
								<span class="button ajax_add_to_cart_button btn btn-default disabled">
									<span>{l s='Add to cart'}</span>
								</span>
							{/if}
						{/if}
						{hook h='displayProductListFunctionalButtons' product=$product}
						<a itemprop="url" class="button lnk_view btn btn-default" href="{$product.link|escape:'html':'UTF-8'}" title="{l s='View'}">
							<span>{l s='More'}</span>
						</a>
						
					</div>
						{if isset($product.new) && $product.new == 1}
							<span class="new-box">
								<span class="new-label">{l s='New'}</span>
							</span>
						{/if}
						{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
							<span class="sale-box">
								<span class="sale-label">{l s='Sale!'}</span>
							</span>
						{/if}
					</div>
				</div>
				<div class="right-block">
					<h5 itemprop="name">
						{if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
						<a class="product-name" href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url" >
							{$product.name|truncate:45:'...'|escape:'html':'UTF-8'}
						</a>
					</h5>
					
					{hook h='displayProductListReviews' product=$product}
					{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
					<div itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="content_price">
						{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
							<span itemprop="price" class="price product-price">
								{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
							</span>
							<meta itemprop="priceCurrency" content="{$priceDisplay}" />
							{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction}
								<span class="old-price product-price">
									{displayWtPrice p=$product.price_without_reduction}
								</span>
								
							{/if}
						{/if}
					</div>
					{/if}
					
					
				</div>
				
				{if $page_name != 'index'}
	 				<div class="functional-buttons clearfix">
						
						{if isset($comparator_max_item) && $comparator_max_item}
							<div class="compare">
								<a class="add_to_compare" href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}">{l s='Add to Compare'}</a>
							</div>
						{/if}
					</div>
				{/if}
			</div><!-- .product-container> -->
		
				</li>
			{/foreach}
			
		</ul>
	</div>
	{else}
	<p class="warning">{l s='No products for this new products.' mod='posnewproduct'}</p>
	{/if}
	
		<script type="text/javascript">
		  $('.pos-new-product .bxslider').bxSlider({
            auto: {if $slideOptions.auto_slide != 1}{$slideOptions.auto_slide}{else}1{/if},
            slideWidth:{if $slideOptions.width_item != ''}{$slideOptions.width_item}{else}262{/if},
			slideMargin: 30,
			infiniteLoop:false,
			minSlides: {if $slideOptions.min_item != ''}{$slideOptions.min_item}{else}3{/if},
			maxSlides: {if $slideOptions.max_item != ''}{$slideOptions.max_item}{else}8{/if},
			speed:  {if $slideOptions.speed_slide != ''}{$slideOptions.speed_slide}{else}3000{/if},
			pause: {if $slideOptions.a_speed != ''}{$slideOptions.a_speed}{else}3000{/if},
			controls: {if $slideOptions.show_nexback != 0}{$slideOptions.show_nexback}{else}false{/if},
            pager: {if $slideOptions.show_control != 0}{$slideOptions.show_control}{else}false{/if},
		});
	</script>
		 
</div>
