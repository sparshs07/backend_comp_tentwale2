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
<body class="bg-gray-100 flex items-center justify-center min-h-screen">





    <div class="bg-white shadow-lg rounded-lg p-8 max-w-sm w-full text-center">
        <h1 class="text-3xl font-bold text-green-500 mb-4">Password Reset Successful!</h1>
        <p class="text-gray-600 mb-6">Your password has been successfully reset. You can now use your new password to log in.</p>
        
        <a href="signin.jsp" class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600 transition-colors duration-300">Go to Login</a>
    </div>

</body>


 



<!-- ##############################BODY############################ -->


    
    <!-- #################FOOTER#################### -->

   
   <!-- --------------------------MENU BUTTON------------------------ -->
<script>
  let home=document.querySelector("#home")
  home.href="tentwala_home.do"
  
  let about=document.querySelector("#about")
  about.innerText="Add Items"
  about.href="tentwala_home_profile.do"
  
  let services=document.querySelector("#services")
  services.innerText="Your Items"
  services.href="your_items.do"
  </script>
<!-- --------------------------MENU BUTTON------------------------ -->


    <!-- ----------------HIDDING----------------------- -->
    <script>
        let want_bec_tentw=document.querySelector("#want_bec_tentw");
        want_bec_tentw.classList.add("hidden");
    </script>
    <!-- ----------------HIDDING----------------------- -->

    <!-- ------------------Display Tentwala Name------------------ -->
    <script>
      let display_name=document.querySelector("#display_name");
      let tentwala_name="${user.tentwalaName}"
      display_name.innerHTML=tentwala_name
    </script>
    <!-- ------------------Display Tentwala Name------------------ -->


<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</body>
</html>