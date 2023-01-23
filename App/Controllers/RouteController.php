<?php

namespace App\Controllers;

use \Core\View;


class RouteController extends \Core\Controller {
 
    public function homeAction() {
        
        session_start();
        $fetch_products = ProductController::getProduct();
        
        View::render("home.php", [
            'fetch_products' => $fetch_products,
        ]);
        
    }

    public function aboutAction() {
        
        View::render("about.php");
        
    }

    public function categoryAction() {
        $category_name = $_GET['category'];
        CategoryController::add();
        $select_products = CategoryController::getCategory($category_name);
        
        View::render("category.php", [
            'select_products' => $select_products,
        ]);
        
    }

    public function contactAction() {
    
        View::render("contact.php");
    }

    public function checkoutAction() {
        CheckoutController::checkoutAction();
        $select_cart_items = CardController::select_cart();
    
        View::render("checkout.php", [
            'select_cart_items' => $select_cart_items,
        ]);
    }

    public function ordersAction() {
        session_start();
        $fetch_orders = OrdersController::getOrders();
    
        View::render("orders.php", [
            'fetch_orders' => $fetch_orders,
        ]);
    }

    public function shopAction() {
        ProductController::add();
        $select_products = ProductController::getAllProduct();
        View::render("shop.php", [
            'select_products' => $select_products,
        ]);
    }


    public function loginAction() {
    
        View::render("login.php");
    }

    public function cardAction() {
        CardController::cardAction();
        $select_cart = CardController::select_cart();
    
        View::render("card.php", [
            'select_cart'=> $select_cart,
        ]);
    }
    
    public function registerAction() {
    
        View::render("register.php");
    }

    public function logoutAction() {

        session_start();
        session_unset();
        session_destroy();

        View::render("home.php");
    }
    
    public function searchAction() {
    
        ProductController::add();
        $fetch_products = ProductController::searchProduct();
        View::render("search_page.php", [
            'fetch_products' => $fetch_products,
        ]);
    }
    
    public function updateAction() {
    
        View::render("user_profile_update.php");
    }

    public function viewsAction() {
        ProductController::add();
        $pid = $_GET['pid'];
        $select_products = ProductController::getOneProduct($pid);
    
        View::render("view_page.php", [
            'select_products' => $select_products,
        ]);
    }

    public function wishlistAction() {
        WishlistController::wishAction();
        $showWishlist = WishlistController::returnWishlist();
    
        View::render("wishlist.php", [
            'showWishlist' => $showWishlist,
        ]);
    }

  
}
