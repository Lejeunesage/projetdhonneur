<?php

namespace App\Controllers;

use \Core\View;


class AdminRouteController extends \Core\Controller {
 
    public function admin_homeAction() {
        session_start();

        if ($_SESSION['role'] !== 'admin' ) {
        header('Location:/');
        }
        $fetch_pendings = AdminHomeController::selectPendings();
        $fetch_completed = AdminHomeController::selectCompleted();
        $number_of_orders = AdminHomeController::numberOfOrders();
        $number_of_products = AdminHomeController::numberOfProducts();
        $number_of_users = AdminHomeController::numberOfUsers();
        $number_of_admins = AdminHomeController::numberOfAdmins();
        $number_of_accounts = AdminHomeController::numberOfAccounts();
        $number_of_messages = AdminHomeController::numberOfMessages();
        
        View::render("admin_page.php",  [
            'fetch_pendings'=>$fetch_pendings,
            'fetch_completed'=>$fetch_completed,
            'number_of_orders'=>$number_of_orders,
            'number_of_products'=>$number_of_products,
            'number_of_users'=>$number_of_users,
            'number_of_admins'=>$number_of_admins,
            'number_of_accounts'=>$number_of_accounts,
            'number_of_messages'=>$number_of_messages,
        ]);
        
    }

    public function admin_productsAction() {
        session_start();

        if ($_SESSION['role'] !== 'admin' ) {
        header('Location:/');
        }

        AdminProductsController::deleteProduct();
        $select_products = ProductController::getAllProduct();
        
        View::render("admin_products.php", [
            'select_products'=>$select_products,
        ]);
        
    }

    public function admin_ordersAction() {
        session_start();

        if ($_SESSION['role'] !== 'admin' ) {
            header('Location:/');
        }

        AdminOrdersController::updateOrder();
        AdminOrdersController::deleteOrder();
        $fetch_orders = AdminOrdersController::selectAllOrders();
        
        View::render("admin_orders.php", ['fetch_orders'=>$fetch_orders]);
        
    }

    public function admin_contactsAction() {
        session_start();

        if ($_SESSION['role'] !== 'admin' ) {
        header('Location:/');
        }

        AdminMessageController::deleteMessage();
        $fetch_message = AdminMessageController::selectAllMessage();
    
        View::render("admin_contacts.php", ['fetch_message'=>$fetch_message]);
    }

    public function update_profileAction() {
        session_start();

        if ($_SESSION['role'] !== 'admin' ) {
        header('Location:/');
        }
    
        View::render("admin_update_profile.php");
    }

    public function update_productAction() {
        session_start();

        if ($_SESSION['role'] !== 'admin' ) {
        header('Location:/');
        }
    
        $fetch_product = AdminUpdateProductController::getOneProduct();
        View::render("admin_update_product.php",[
            "fetch_product"=>$fetch_product,
        ]);
    }

    public function admin_usersAction() {
        session_start();

        if ($_SESSION['role'] !== 'admin' ) {
            header('Location:/');
        }

        $fetch_users = AdminUserController::selectAllUsers();
    
        View::render("admin_users.php", ["fetch_users"=>$fetch_users]);
    }



    public function logoutAction() {

        session_start();
        session_unset();
        session_destroy();

        View::render("home.php");
    }
    

  
}
