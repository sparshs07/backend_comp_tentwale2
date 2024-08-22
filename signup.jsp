<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body class="bg-gray-100 font-sans">
<!-- ############### HEADER ###################### -->
<div >
    <c:import url="header.jsp"/>
</div>
<!-- ############### HEADER ###################### -->

<!-- #######################BODY################################## -->

<div class="flex min-h-screen flex-col justify-center px-6 py-2  lg:px-8">
    <div class="sm:mx-auto sm:w-full sm:max-w-sm">
      <!-- <img class="mx-auto h-10 w-auto" src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600" alt="Your Company"> -->
      <h2 class="mt-6 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900 ">Create your account</h2>
    </div>
  
    <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-sm">
      <form action="signup.do" method="POST" class="space-y-5">
        <!-- Name Field -->
        <div>
          <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
          <input type="text" id="name" name="name" autocomplete="on" required class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-500">
        </div>
        <!-- Email Field -->
        <div>
          <label for="email" class="block text-sm font-medium text-gray-700">Email Address</label>
          <input id="email" name="email" type="email" autocomplete="email" pattern="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" required class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-500">
          <p class="hidden mt-1 text-sm text-red-500" id="email_error">Please enter a valid Email Address!</p>
        </div>
        <!-- Password Field -->
        <div>
          <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
          <input id="password" name="password" type="password" minlength="8" maxlength="16" required class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-500">
        </div>
        <!-- Phone Field -->
        <div>
          <label for="phone" class="block text-sm font-medium text-gray-700">Phone</label>
          <input type="text" id="phone" name="phone" required class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-500">
          <p class="hidden mt-1 text-sm text-red-500" id="phone_error">Please enter a valid phone number!</p>
        </div>
        <!-- OTP Field -->
        <div>
          <label class="block text-sm font-medium text-gray-700">OTP</label>
          <div class="flex space-x-1 mt-1">
            <!-- OTP Inputs -->
            <input type="text" maxlength="1" autocomplete="off" name="c1" onkeyup="focusNextInput(this, '', 'code2')" id="code1" class="w-12 h-12 text-center border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500">
            <input type="text" maxlength="1" autocomplete="off" name="c2" onkeyup="focusNextInput(this, 'code1', 'code3')" id="code2" class="w-12 h-12 text-center border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500">
            <input type="text" maxlength="1" autocomplete="off" name="c3" onkeyup="focusNextInput(this, 'code2', 'code4')" id="code3" class="w-12 h-12 text-center border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500">
            <input type="text" maxlength="1" autocomplete="off" name="c4" onkeyup="focusNextInput(this, 'code3', 'code5')" id="code4" class="w-12 h-12 text-center border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500">
            <input type="text" maxlength="1" autocomplete="off" name="c5" onkeyup="focusNextInput(this, 'code4', 'code6')" id="code5" class="w-12 h-12 text-center border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500">
            <input type="text" maxlength="1" autocomplete="off" name="c6" onkeyup="focusNextInput(this, 'code5', '')" id="code6" class="w-12 h-12 text-center border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-purple-500">
          </div>
          <p class="hidden mt-1 text-sm text-red-500" id="otp_error">Please enter a valid OTP!</p>
          <p class="hidden mt-1 text-sm text-green-600" id="otp_sent_message">OTP Sent To Your Email!</p>
        </div>
        <!-- Send OTP Button -->
        <div>
          <button type="button" id="otpButton" class="hidden basis-1/4 h-8 text-white bg-gradient-to-br from-purple-600 to-blue-500 hover:bg-gradient-to-bl focus:ring-4 focus:outline-none focus:ring-blue-300 dark:focus:ring-blue-800 font-medium rounded-lg text-xs px-5 py-2 text-center me-2 mb-2">Send OTP</button>
        </div>
        <!-- Recaptcha -->
        <div class="mt-4">
          <div class="g-recaptcha" data-sitekey="6LfH75IoAAAAAA-ExT9NQ6e-3NOnnQAcvoiXoNaI"></div>
        </div>
        <!-- Submit Button -->
        <div>
          <button type="submit" disabled id="signup_btn" class="w-full py-3 px-4 bg-purple-600 text-white rounded-md shadow-lg hover:bg-purple-700 transition duration-300">Sign Up</button>
        </div>
      </form>
      
  </div>
</div>

  
  

<!-- #######################BODY################################## -->
  
  
<!-- ####################FOOTER######################### -->
<div class="mt-16">
    <c:import url="footer.jsp"/>
</div>
<!-- ####################FOOTER######################### -->

<!-- ##############DROP DOWN PROFILE OFF FROM HEADER#################### -->
  <script>
    let user_menu_button=document.querySelector('#user-menu-button');
    user_menu_button.classList.add('hidden')
  </script>
<!-- ##############DROP DOWN PROFILE OFF FROM HEADER#################### -->

<!-- ################PHONE CHECKING##################### -->
  <script>
    let phn=document.querySelector("#phone")
    let phone_error=document.querySelector("#phone_error")


    let contactPattern = /^[6-9][0-9]{9}$/;
    let checkDuplicatePhone = false;

    let checkPhoneExist=async(phn)=>{
      let response=await fetch('check_phone_exist.do?phone='+phn);
      let result=await response.text();
      return result;
    }

    phn.addEventListener('focus',()=>{
      checkDuplicatePhone=false;
      phone_error.classList.remove('hidden');
      if(phone_error.classList.contains('text-red-500')){
        phone_error.classList.replace('text-red-500','text-gray-500');
        phone_error.innerText='Enter a valid Phone Number!'
        
      }
      else if(phone_error.classList.contains('text-green-500')){
        phone_error.classList.replace('text-green-500','text-gray-500')
        phone_error.innerText='Enter a valid Phone Number!'
      }

    })

    phn.addEventListener('blur',()=>{
      if(contactPattern.test(phn.value)){
        checkPhoneExist(phn.value).then((data)=>{
          if(data=='true'){
          phone_error.classList.replace('text-gray-500','text-red-500');
          phone_error.innerText='Ohh!!Phone Number alredy Exists'

          }
          else{
            phone_error.classList.replace('text-gray-500','text-green-500');
            phone_error.innerText='Yayy!!Number Accepted'
          }
        }).catch((error)=>{
          console.log(error)
        })
      }else{
        phone_error.classList.replace('text-gray-500','text-red-500');
        phone_error.innerText='Please enter phone No. in correct format!!'
      }
    })
  </script>
<!-- ################PHONE CHECKING##################### -->


<!-- #####################EMAIL_CHECKING#################### -->
  <script>
    let email=document.querySelector("#email")
    let email_error=document.querySelector("#email_error")
    let otp_btn=document.querySelector("#otpButton")

    let emailPattern=/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
    let checkDuplicateEmail=false

    let checkEmailExists=async(email)=>{
      let response=await fetch('check_email_exists.do?email='+email);
      let result=await response.text();
      return result;
    }

    email.addEventListener('focus',()=>{
      checkDuplicateEmail=false;
      email_error.classList.remove('hidden');

      if(email_error.classList.contains('text-red-500')){
        email_error.classList.replace('text-red-500','text-gray-500')
        email_error.innerText='Enter a valid Email'
        otp_btn.classList.add('hidden')
      }

      else if(email_error.classList.contains('text-green-500')){
        email_error.classList.replace('text-green-500','text-gray-500')
        email_error.innerText='Enter a valid Email'
        otp_btn.classList.add('hidden')
      }
    })

    email.addEventListener('blur',(event)=>{
      if(emailPattern.test(email.value)){
        checkEmailExists(email.value).then((data)=>{
          if(data=='true'){
            email_error.classList.replace('text-gray-500','text-red-500')
            email_error.innerText='Ohh! Email Already Exist'
            otp_btn.classList.add('hidden')
          }
          else{
            email_error.classList.replace('text-gray-500','text-green-500')
            email_error.innerText='Yayy!! Email Accepted'
            otp_btn.classList.remove('hidden')
          }
        }).catch((error)=>{
          console.log(error)
        });
      }else{
        email_error.classList.replace('text-gray-500','text-red-500')
        email_error.innerText='Please Enter Email in Correct Format!'
        otp_btn.classList.add('hidden')
      }
    });
  </script>

<!-- #####################EMAIL CHECKING#################### -->

<!-- ################SEND OTP#################### -->
  <script>
    let otpButton=document.querySelector("#otpButton")
    let emailOTP=document.querySelector("#email")
    let otp_sent_message=document.querySelector("#otp_sent_message")

    let sendOTP=async(otpButton)=>{
      let response=await fetch('send_otp.do?emailOTP='+emailOTP.value);
      let result=await response.text();
      return result;
    }
    otpButton.addEventListener('click',(event)=>{
      otpButton.setAttribute("disabled","disabled")
      
      otpButton.innerText="Sending..."
      sendOTP(event.target.value).then((data)=>{
        otpButton.removeAttribute("disabled")
        otpButton.innerText="Send OTP"
        if(data=='true')
          otp_sent_message.classList.remove('hidden')
        else
          console.log("OTP NOT SENT")
      }).catch((error)=>{
        console.log("Error")
      })
    })
  </script>
<!-- ################SEND OTP#################### -->

<!-- ################OTP FIELDS/OTP CHECKING################# -->
<script>
    let cd1=document.querySelector("#code1")
    let cd2=document.querySelector("#code2")
    let cd3=document.querySelector("#code3")
    let cd4=document.querySelector("#code4")
    let cd5=document.querySelector("#code5")
    let cd6=document.querySelector('#code6')
  let otp_error=document.querySelector('#otp_error')
  let otp_sent_msg=document.querySelector("#otp_sent_message")

  let signup_btn=document.querySelector('#signup_btn')


  // use this simple function to automatically focus on the next input
  function focusNextInput(el, prevId, nextId) {
      if (el.value.length === 0) {
          document.getElementById(prevId).focus();
      } else {
          document.getElementById(nextId).focus();
      }
  }

  cd1.addEventListener('focus',()=>{
    otp_sent_msg.classList.add('hidden')
  })

  let checkOTP=async(inp,otp)=>{
    if(inp=='insertText'){
      let response=await fetch('check_otp.do?otp='+otp);
      let result=await response.text();
      return result;
    }
  }

  function myFunction(event) {
   let text = event.inputType;
   return text
  }

  cd6.addEventListener('input',(event)=>{
    let inp=myFunction(event)
    let otp=code1.value.concat(code2.value,code3.value,code4.value,code5.value,code6.value)
    checkOTP(inp,otp).then((data)=>{
      if(data=='true'){
      otp_error.classList.add('hidden')
      otpButton.classList.add('hidden')
      signup_btn.removeAttribute('disabled')
      }
      else{
        otp_error.classList.replace('hidden','text-red-500')
        otpButton.classList.remove('hidden')
        signup_btn.setAttribute('disabled','disabled')
      }
    }).catch((error)=>{
      console.log("ERROR")
    })
  })
 
</script>
<!-- ################OTP FIELDS################# -->


</body>
</html>