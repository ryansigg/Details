{*
$Id: subcategories.tpl,v 1.3.2.3.2.1 2012/07/13 13:45:52 tito Exp $
vim: set ts=2 sw=2 sts=2 et:
*}
{if $active_modules.Bestsellers and $config.Bestsellers.bestsellers_menu ne "Y"}
  {include file="modules/Bestsellers/bestsellers.tpl"}
{/if}

{if $active_modules.New_Arrivals}
  {include file="modules/New_Arrivals/new_arrivals.tpl" new_arrivals_main="Y"}
{/if}

{if $active_modules.Special_Offers}
  {include file="modules/Special_Offers/customer/category_offers_short_list.tpl"}
{/if}

{if $active_modules.Banner_System and $right_banners ne ''}
  {include file="modules/Banner_System/banner_rotator.tpl" banners=$right_banners banner_location='R'}
{/if}

{if $config.Appearance.subcategories_per_row eq 'Y'}

  {if $current_category.description ne ""}
    <div class="subcategory-descr">{$current_category.description|amp}</div>
  {/if}

  {if $categories}
    {include file="customer/main/subcategories_t.tpl"}
  {/if}

{else}

  <img class="subcategory-image" src="{get_category_image_url category=$current_category}" alt="{$current_category.category|escape}"{if $current_category.image_x} width="{$current_category.image_x}"{/if}{if $current_category.image_y} height="{$current_category.image_y}"{/if} />
  {inc assign="standoff" value=$current_category.image_x|default:0 inc=15}
  <div style="margin-left: {$standoff}px;">
    {if $current_category.description ne ""}
      <div class="subcategory-descr">{$current_category.description|amp}</div>
    {/if}

    {if $categories}
      {include file="customer/main/subcategories_list.tpl"}
    {/if}
  </div>
  <div class="clearing"></div>

{/if}

{if $f_products}
  {include file="customer/main/featured.tpl"}
{/if}

{* CartWorks.com - Power Filter *}
{if $navigation_script_pf}
  {assign var="navigation_script" value=$navigation_script_pf}
{/if}

{if $config.Power_Filter.power_filter_skin ne "3"}
  {include file="modules/Power_Filter/power_filter.tpl"}
{/if}
{* CartWorks.com - Power Filter *}

<h1>{$current_category.category|amp}</h1>

{if $cat_products}

  {capture name=dialog}

    {include file="customer/main/navigation.tpl"}

    {include file="customer/main/products.tpl" products=$cat_products}
    
    {include file="customer/main/navigation.tpl"}

  {/capture}
    
  {include file="customer/dialog.tpl" title=$lng.lbl_products content=`$smarty.capture.dialog` products_sort_url="home.php?cat=`$cat`&" sort=true additional_class="products-dialog dialog-category-products-list"}

{elseif not $cat_products and not $categories}

  {$lng.txt_no_products_in_cat}

{/if}
