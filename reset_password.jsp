<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
</head>
<body>
    <!-- ############### HEADER ###################### -->
<div >
    <c:import url="header.jsp"/>
</div>
<!-- ############### HEADER ###################### -->


<!-- ############BODY################# -->
<div class="flex min-h-full flex-col justify-center px-6 pt-24 pb-24   lg:px-8">
    <div class="sm:mx-auto sm:w-full sm:max-w-sm">
      <!-- <img class="mx-auto h-10 w-auto" src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600" alt="Your Company"> -->
      <h2 class="mt-6 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900 ">Change password of your account </h2>
    </div>
  
    <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-sm">
      <form class="space-y-6" action="reset_password.do" method="POST">

        <div>
          <label for="email" class="block text-sm font-medium leading-6 text-gray-900">Email address</label>
          <div class="mt-2">
            <input id="email1" name="email" readonly type="email" autocomplete="off" value='<c:out value="${reset_email}"/>' pattern="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" required class="block w-full rounded-md border-0 py-1.5 pl-2 text-gray-900 shadow hover:shadow-2xl ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
            <p hidden name="p_email"><c:out value="${reset_email}"/></p>            
          </div>
        </div>
  
        <div>
          <div class="flex items-center justify-between">
            <label for="password" class="block text-sm font-medium leading-6 text-gray-900">New Password</label>
           
          </div>
          <div class="mt-2">
            <input id="new_password"  type="password" minlength="8" maxlength="16"  required class="block w-full rounded-md border-0 py-1.5 pl-2 text-gray-900 shadow hover:shadow-2xl ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
          </div>
        </div>

        <div>
          <div class="flex items-center justify-between">
            <label for="password" class="block text-sm font-medium leading-6 text-gray-900">Confirm Password</label>
           
          </div>
          <div class="mt-2">
            <input id="confirm_password" name="password" type="password" minlength="8" maxlength="16"  required class="block w-full rounded-md border-0 py-1.5 pl-2 text-gray-900 shadow hover:shadow-2xl ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
          </div>
        </div>
        <p class="hidden mt-1 text-lg text-red-500 dark:text-red-300" id="password_msg">Sorry! Both password do not match</p>


        <div class="flex items-center justify-between">
          <c:if test="${signin_error_msg !=null}">
            <div>
            <p class="mt-1 text-lg text-red-500 dark:text-red-300" id="error_message"><c:out value="${signin_error_msg}" /></p>
            </div>
          </c:if>
        </div>

        <div>
          <button type="submit" disabled  id="change_pass_btn" class="flex w-full justify-center rounded-md bg-gradient-to-r from-violet-500 to-fuchsia-500 px-3 py-3 text-sm font-semibold leading-6 text-white shadow-2xl hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Change Password</button>
        </div>
    </form>
  </div>
</div>

<!-- ############BODY################# -->

<!-- ####################FOOTER######################### -->
<div class="mt-2">
    <c:import url="footer.jsp"/>
</div>
<!-- ####################FOOTER######################### -->



<!-- ##############DROP DOWN PROFILE OFF FROM HEADER#################### -->
  <script>
    let user_menu_button=document.querySelector('#user-menu-button');
    user_menu_button.classList.add('hidden')
  </script>
<!-- ##############DROP DOWN PROFILE OFF FROM HEADER#################### -->


<!-- ###############CHECKING PASSWORD######################## -->
  <script>
    let new_password=document.querySelector('#new_password');
    let confirm_password=document.querySelector('#confirm_password');
    let password_msg=document.querySelector('#password_msg');

    confirm_password.addEventListener('blur',()=>{
      if(new_password.value != confirm_password.value){
        password_msg.classList.remove('hidden');
        
      }
      else{
        change_pass_btn.removeAttribute('disabled')
      }
        
      })

      new_password.addEventListener('focus',()=>{
        password_msg.classList.add('hidden');
        change_pass_btn.setAttribute('disabled','disabled')
      })

      confirm_password.addEventListener('focus',()=>{
        password_msg.classList.add('hidden');
        change_pass_btn.setAttribute('disabled','disabled')

      })
    
  </script>
<!-- ###############CHECKING PASSWORD######################## -->


<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</body>
</html>