<div class="pos-feature-product">
	<div class="pos-feature-product-title title_block"><h4>{l s='Destaques' mod='posfeatureproduct'}</h4></div>
	{if count($products)>1}
		<ul class="bxslider">
			{foreach from=$products item=product name=posFeatureProducts}
				<li class="feature-productslider-item ajax_block_product {if $smarty.foreach.posFeatureProducts.first}first_item{elseif $smarty.foreach.posFeatureProducts.last}last_item{else}item{/if}">
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
									<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart' mod='posfeatureproduct'}" data-id-product="{$product.id_product|intval}">
										<span>{l s='Add to cart' mod='posfeatureproduct'}</span>
									</a>
								{else}
									<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart' mod='posfeatureproduct'}" data-id-product="{$product.id_product|intval}">
										<span>{l s='Add to cart' mod='posfeatureproduct'}</span>
									</a>
								{/if}						
							{else}
								<span class="button ajax_add_to_cart_button btn btn-default disabled">
									<span>{l s='Add to cart' mod='posfeatureproduct'}</span>
								</span>
							{/if}
						{/if}
						{hook h='displayProductListFunctionalButtons' product=$product}
						<a itemprop="url" class="button lnk_view btn btn-default" href="{$product.link|escape:'html':'UTF-8'}" title="{l s='View' mod='posfeatureproduct'}">
							<span>{l s='More' mod='posfeatureproduct'}</span>
						</a>
						
					</div>
						
						{if isset($product.new) && $product.new == 1}
							<span class="new-box">
								<span class="new-label">{l s='New' mod='posfeatureproduct'}</span>
							</span>
						{/if}
						{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
							<span class="sale-box">
								<span class="sale-label">{l s='Sale!' mod='posfeatureproduct'}</span>
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
					
					<!--{if isset($product.color_list)}
						<div class="color-list-container">{$product.color_list} </div>
					{/if}-->
					<!--<div class="product-flags">
						{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
							{if isset($product.online_only) && $product.online_only}
								<span class="online_only">{l s='Online only' mod='posfeatureproduct'}</span>
							{/if}
						{/if}
						{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
							{elseif isset($product.reduction) && $product.reduction && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
								<span class="discount">{l s='Reduced price!' mod='posfeatureproduct'}</span>
							{/if}
					</div>-->
					<!--{if (!$PS_CATALOG_MODE && $PS_STOCK_MANAGEMENT && ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
						{if isset($product.available_for_order) && $product.available_for_order && !isset($restricted_country_mode)}
							<span itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="availability">
								{if ($product.allow_oosp || $product.quantity > 0)}
									<span class="available-now">
										<link itemprop="availability" href="http://schema.org/InStock" />{l s='In Stock' mod='posfeatureproduct'}
									</span>
								{elseif (isset($product.quantity_all_versions) && $product.quantity_all_versions > 0)}
									<span class="available-dif">
										<link itemprop="availability" href="http://schema.org/LimitedAvailability" />{l s='Product available with different options' mod='posfeatureproduct'}
									</span>
								{else}
									<span class="out-of-stock">
										<link itemprop="availability" href="http://schema.org/OutOfStock" />{l s='Out of stock' mod='posfeatureproduct'}
									</span>
								{/if}
							</span>
						{/if}
					{/if}-->
				</div>
				
				
			</div><!-- .product-container> -->
		</li>
			{/foreach}
		</ul>
	{else}
	<p class="warning">{l s='No products for this new products.' mod='posfeatureproduct'}</p>
	{/if}
	<script type="text/javascript">
		  $('.pos-feature-product .bxslider').bxSlider({
			auto: {if $slideOptions.auto_slide != 1}{$slideOptions.auto_slide}{else}1{/if},
			slideWidth:{if $slideOptions.width_item != ''}{$slideOptions.width_item}{else}262{/if},
			slideMargin: 30,
			autoHover: true,
			infiniteLoop: false,
			minSlides: {if $slideOptions.min_item != ''}{$slideOptions.min_item}{else}1{/if},
			maxSlides: {if $slideOptions.max_item != ''}{$slideOptions.max_item}{else}3{/if},
			speed:  {if $slideOptions.speed_slide != ''}{$slideOptions.speed_slide}{else}5000{/if},
			pause: {if $slideOptions.a_speed != ''}{$slideOptions.a_speed}{else}1000{/if},
			controls: {if $slideOptions.show_nexback != 0}{$slideOptions.show_nexback}{else}false{/if},
			pager: {if $slideOptions.show_control != 0}{$slideOptions.show_control}{else}false{/if},
		});
	</script>
		 
</div>
