<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ------------------------------NAVBAR---------------------START -->
<nav class="bg-gray-800 border-gray-200 dark:bg-gray-900">
  <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-9 p-3">
    <a href="index.do" class="flex items-center space-x-3 rtl:space-x-reverse">
        <img src="static/images/tw_logo.png" class="h-8" alt="Flowbite Logo" />
        <img src="static/images/tentwale-high-resolution-logo-transparent (2).png" class="h-8" alt="Flowbite Logo" />
        <!-- <span class="self-center text-white text-2xl font-semibold whitespace-nowrap dark:text-white">TentWale</span> -->
    </a>
    
    <div class="flex items-center md:order-2 space-x-5 md:space-x-0 rtl:space-x-reverse">

    <!-- --------------------------CART LOGO---------------------------------------   -->
      
  <button type="button" data-modal-target="default-modal-1" data-modal-toggle="default-modal-1" id="cart" class="mr-4 hidden relative inline-flex items-center p-1 text-sm font-medium text-center text-white bg-gray-700 rounded-full hover:bg-gray-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
      <img class="w-8 h-8 rounded-full" src="static/images/cart.png" alt="user photo">
      <div class="hidden absolute inline-flex items-center justify-center w-4 h-4 text-xs font-bold text-white bg-red-500 border-2 border-white rounded-full -top-2 -end-2 dark:border-gray-900"></div>
  </button>
  
    <!-- --------------------------CART LOGO---------------------------------------   -->

      <button type="button" class="flex text-sm bg-gray-800 rounded-full  md:me-0 focus:ring-4 focus:ring-blue-300 dark:focus:ring-blue-600" id="user-menu-button" aria-expanded="false" data-dropdown-toggle="user-dropdown" data-dropdown-placement="bottom">
        <span class="sr-only">Open user menu</span>
        <img class="w-8 h-8 rounded-full" src="static/images/user.png" alt="user photo">
      </button>

        <!-- Dropdown menu -->
        <div class="z-50 hidden my-4 text-base list-none bg-white divide-y divide-gray-100 rounded-lg shadow dark:bg-gray-700 dark:divide-gray-600" id="user-dropdown">
          <div class="px-4 py-3">
            <span class="block text-sm text-gray-900 dark:text-white" id="display_name"><c:out value="${user.name}" /></span>
            <span class="block text-sm  text-gray-500 truncate dark:text-gray-400"><c:out value="${user.email}" /></span>
          </div>
          <ul class="py-2" aria-labelledby="user-menu-button">
            <li>
              <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Dashboard</a>
            </li>
            <li>
              <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Settings</a>
            </li>
            <li>
              <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Earnings</a>
            </li>
            <li>
              <a   data-modal-target="default-modal" data-modal-toggle="default-modal" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Sign out</a>
            </li>
          </ul>
        </div>
        <button data-collapse-toggle="navbar-user" type="button" class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="navbar-user" aria-expanded="false">
          <span class="sr-only">Open main menu</span>
          <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h15M1 7h15M1 13h15"/>
          </svg>
      </button>


    </div>
    <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="navbar-user">
      <ul class="flex flex-col font-medium pt-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-700 md:space-x-8 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 md:bg-gray-800 dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
        <li>
          <a href="home_profile.do" id="home" class="block py-2 px-1 text-white bg-blue-700 rounded md:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:text-blue-500" aria-current="page">Home</a>
        </li>
        <li>
          <a href="#" id="about" class="block py-2 px-1 text-white rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">About</a>
        </li>
       
        <c:if test="${not empty user}">
            <li>
              <a href="want_to_become_tentwala.jsp" id="want_bec_tentw" class="block py-2 px-1 text-white rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">Want to become a TentWala?</a>
            </li>
        </c:if>

        <li>
          <a href="#" id="services" class="block py-2 px-1 text-white rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">Services</a>
        </li>
        
      </ul>
    </div>
    </div>
  </nav>
<!-- ------------------------------NAVBAR---------------------END-->

<!-- -----------------------------------SIGNOUT MODAL------------------------ -->

  
  <!-- Main modal -->
  <div id="default-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
      <div class="relative p-4 w-full max-w-2xl max-h-full">
          <!-- Modal content -->
          <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
              <!-- Modal header -->
              <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                  <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                      Are you sure you want to logout?
                  </h3>
                  <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="default-modal">
                      <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                      </svg>
                      <span class="sr-only">Close modal</span>
                  </button>
              </div>
             
              <!-- Modal footer -->
              <div class="flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b dark:border-gray-600">
                  <button id="confirm_signout_btn" data-modal-hide="default-modal" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Confirm</button>
                  <button data-modal-hide="default-modal" type="button" class="ms-3 text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-blue-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600">Decline</button>
              </div>
          </div>
      </div>
  </div>

  <script>
    let confirm_signout_btn=document.querySelector("#confirm_signout_btn");

    let signoutSession=async ()=>{
      let response=await fetch('signout.do');
      let result=await response.text();
      return result;
    }
    confirm_signout_btn.addEventListener('click',()=>{
      signoutSession().then((data)=>{
        if(data=='true'){
          window.open('http://localhost:8080/tentwale/signin.jsp','_self')
        }
      }).catch((error)=>{
        console.log(error)
      })
    })
  </script>

<!-- -----------------------------------SIGNOUT MODAL------------------------ -->
  