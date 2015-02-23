{*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<!-- Block myaccount module -->
<section class="myaccount block footer-block col-xs-12 col-sm-3">
	<div class="title_block"><h4>{l s='My account' mod='blockmyaccountfooter'}</h4></div>
	<div class="block_content toggle-footer">
		<ul class="bullet">
			<li>
				<a href="{$link->getPageLink('history', true)|escape:'html':'UTF-8'}" title="{l s='My orders' mod='blockmyaccountfooter'}" rel="nofollow">
					{l s='Minha Conta' mod='blockmyaccountfooter'}
				</a>
			</li>

			<li>
				<a href="{$link->getPageLink('order-follow', true)|escape:'html':'UTF-8'}" title="{l s='My merchandise returns' mod='blockmyaccountfooter'}" rel="nofollow">
					{l s='Login' mod='blockmyaccountfooter'}
				</a>
			</li>

			<li>
				<a href="{$link->getPageLink('order-slip', true)|escape:'html':'UTF-8'}" title="{l s='My credit slips' mod='blockmyaccountfooter'}" rel="nofollow">
					{l s='Meu Carrinho' mod='blockmyaccountfooter'}
				</a>
			</li>

			<li>
				<a href="{$link->getPageLink('addresses', true)|escape:'html':'UTF-8'}" title="{l s='My addresses' mod='blockmyaccountfooter'}" rel="nofollow">
					{l s='Checkout' mod='blockmyaccountfooter'}
				</a>
			</li>

			{$HOOK_BLOCK_MY_ACCOUNT}

            {if $is_logged}
            	<li>
            		<a href="{$link->getPageLink('index')}?mylogout" title="{l s='Sign out' mod='blockmyaccountfooter'}" rel="nofollow">
            			{l s='Sign out' mod='blockmyaccountfooter'}
            		</a>
            	</li>
            {/if}
		</ul>
	</div>
</section>
<!-- /Block myaccount module -->
