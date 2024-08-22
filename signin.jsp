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
<body class="bg-gray-100 font-sans">
    <!-- ############### HEADER ###################### -->
<div >
    <c:import url="header.jsp"/>
</div>
<!-- ############### HEADER ###################### -->

<!-- ################MODAL FOR FORGOT PASSWORD###################### -->
  


<!-- Modal toggle -->
<!-- <button data-modal-target="authentication-modal" data-modal-toggle="authentication-modal" class="block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button">
  Toggle modal
</button> -->

<!-- Main modal -->
<div id="authentication-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative p-4 w-full max-w-md max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                    Forgot Password?
                </h3>
                <button type="button" class="end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="authentication-modal">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
            </div>
            <!-- Modal body -->
            <div class="p-4 md:p-5">
                <form class="space-y-4" action="#">
                    <div>
                        <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your email</label>
                        <input type="email" name="email" id="modal_email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="name@gmail.com" required>
                    </div>
                    <p class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="email_error">Please enter valid Email.We will send you reset link!!</p>
                    <p class="hidden mt-1 text-sm text-green-500 dark:text-green-500" id="sent_email_success">Email sent successfully!Please check email to reset password.</p>
                    <p class="hidden mt-1 text-sm text-red-500 dark:text-red-500" id="sent_email_fail">Email sending failure!Please try again.</p>
                  </form>
                  <button id="modal_email_btn" type="submit" class="mt-4 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Send Email</button>
            </div>
        </div>
    </div>
</div> 

<!-- ################MODAL FOR FORGOT PASSWORD###################### -->

<!-- ############BODY################# -->
<div class="flex min-h-screen flex-col justify-center px-6 pt-24 pb-24   lg:px-8">
    <div class="sm:mx-auto sm:w-full sm:max-w-sm">
      <!-- <img class="mx-auto h-10 w-auto" src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600" alt="Your Company"> -->
      <h2 class="mt-6 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900 ">SignIn to your account</h2>
    </div>
  
    <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-sm">
      <form class="space-y-6" action="signin.do" id="form" method="POST">

        <div>
          <label for="email" class="block text-sm font-medium leading-6 text-gray-900">Email address</label>
          <div class="mt-2">
            <!-- Sir did type=text -->
            <input id="email1" name="email" type="email" autocomplete="email" pattern="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" required class="block w-full rounded-md border-0 py-1.5 pl-2 text-gray-900 shadow hover:shadow-2xl ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
            
            <p class="hidden mt-1 text-sm text-red-500 dark:text-red-300" id="email_error">Please enter valid Email Address!!</p>
          </div>
        </div>
  
        <div>
          <div class="flex items-center justify-between">
            <label for="password" class="block text-sm font-medium leading-6 text-gray-900">Password</label>
           
          </div>
          <div class="mt-2">
            <input id="password1" name="password" type="password" minlength="8" maxlength="16"  required class="block w-full rounded-md border-0 py-1.5 pl-2 text-gray-900 shadow hover:shadow-2xl ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
          </div>
        <div class="flex justify-end">
            <label class=" ms-2 mt-2 text-sm font-medium text-gray-900 dark:text-gray-300"> <a  id="show_modal_button" data-modal-target="authentication-modal" data-modal-toggle="authentication-modal" class="text-blue-600 dark:text-blue-500 hover:underline">Forgot Password??</a></label>
        </div>
        </div>

        <div class="flex items-center justify-between">
          <c:if test="${signin_error_msg !=null}">
            <div>
            <p class="mt-1 text-lg text-red-500 dark:text-red-300" id="error_message"><c:out value="${signin_error_msg}" /></p>
            </div>
          </c:if>
        </div>

        <div>
          <button type="submit"  id="signup_btn" class="flex w-full justify-center rounded-md bg-gradient-to-r from-violet-500 to-fuchsia-500 px-3 py-3 text-sm font-semibold leading-6 text-white shadow-2xl hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Sign In</button>
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


<!-- ################SEND RESET EMAIL###################### -->
  <script>
    let modal_email_btn=document.querySelector("#modal_email_btn");
    let email_modal=document.querySelector('#modal_email');
    let sent_email_success=document.querySelector('#sent_email_success');
    let sent_email_fail=document.querySelector('#sent_email_fail');

    let sendResetEmail=async(modal_email_btn)=>{
      let response=await fetch('send_reset_email.do?email='+email_modal.value);
      let result=await response.text();
      return result;
    }

    modal_email_btn.addEventListener('click',()=>{
      
      modal_email_btn.setAttribute("disabled","disabled")
      modal_email_btn.innerText='Sending email...'
      sendResetEmail().then((data)=>{
        modal_email_btn.removeAttribute('disabled');
        modal_email_btn.innerText='Send email'
        if(data == 'true'){
          sent_email_success.classList.remove('hidden');
          sent_email_fail.classList.add('hidden');
        }
        else{
          sent_email_fail.classList.remove('hidden')
          sent_email_success.classList.add('hidden')
          console.log("Mail not sent")
        }
      }).catch((error)=>{
        console.log("ERROR")
      })
    })

    email_modal.addEventListener('focus',()=>{
      sent_email_fail.classList.add('hidden');
      sent_email_success.classList.add('hidden')
    })
  </script>
<!-- ################SEND RESET EMAIL###################### -->

<!-- ##############DROP DOWN PROFILE OFF FROM HEADER#################### -->
  <script>
    let user_menu_button=document.querySelector('#user-menu-button');
    user_menu_button.classList.add('hidden')
  </script>
<!-- ##############DROP DOWN PROFILE OFF FROM HEADER#################### -->

<!-- #######################CHECK USER TYPE################# -->
<!-- #################REMOVING ERROR MESSAGE######################### -->
  <script>
    let error_message=document.querySelector("#error_message");
    let email=document.querySelector('#email1');
    let password=document.querySelector('#password1');
    

    let checkUserType=async ()=>{
      let response=await fetch('check_user_type.do?email='+email.value);
      let result=await response.text();
      return result;
    }

    email.addEventListener('focus',()=>{
      error_message.classList.add('hidden');
    })

    
  </script>
<!-- #################REMOVING ERROR MESSAGE######################### -->
<!-- #######################CHECK USER TYPE################# -->

  


<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</body>
</html>