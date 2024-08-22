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
    <!-- ##############HEADER################## -->
        <c:import url="header.jsp" />
    <!-- ##############HEADER################## -->

<!-- ##############################BODY############################ -->





    <!-- Container for the entire page -->
    <div class="flex items-center justify-center min-h-screen py-12 px-4 sm:px-6 lg:px-8">
        <div class="max-w-md w-full space-y-8 bg-white p-8 rounded-lg shadow-lg">
            <!-- Title -->
            <h1 class="text-3xl font-bold text-center text-green-600">
                Thank You!
            </h1>

            <!-- Order Confirmation -->
            <div class="text-center">
                <svg class="mx-auto h-12 w-12 text-green-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7M5 13h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2z" />
                </svg>
                <p class="mt-2 text-lg text-gray-600">
                    Your order has been successfully placed!
                </p>
            </div>

            <!-- Order Details -->
            <div class="mt-8">
                <h2 class="text-xl font-semibold text-gray-800">Order Details</h2>
                <div class="mt-4 space-y-4">
                    <div class="bg-gray-50 p-4 rounded-lg shadow-sm">
                        <p class="text-sm font-medium text-gray-600">Order Number:</p>
                        <p class="text-lg font-bold text-gray-900">#TW${random}</p>
                    </div>
                    <div class="bg-gray-50 p-4 rounded-lg shadow-sm">
                        <p class="text-sm font-medium text-gray-600">Event Type:</p>
                        <p class="text-lg font-bold text-gray-900">Occasion</p>
                    </div>
                    <div class="bg-gray-50 p-4 rounded-lg shadow-sm">
                        <p class="text-sm font-medium text-gray-600">Total Amount:</p>
                        <p class="text-lg font-bold text-gray-900">${total_price}</p>
                    </div>
                </div>
            </div>

            <!-- Next Steps -->
            <div class="mt-8 text-center">
                <p class="text-gray-600">You will receive a confirmation email shortly with the details of your order. In the meantime, feel free to <a href="#" class="text-green-600 hover:underline">contact us</a> if you have any questions.</p>
                <a href="home_profile.do" class="mt-4 inline-block px-6 py-2.5 bg-green-600 text-white font-semibold rounded-lg shadow-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500">
                    Return to Home
                </a>
            </div>
        </div>
    </div>







<!-- ##############################BODY############################ -->


    <!-- #################FOOTER#################### -->
    <!-- <div class="min-h-screen flex flex-col">
        <div class="fixed bottom-0 left-0 right-0"> -->
            <c:import url="footer.jsp" />
        <!-- </div>
    </div> -->
    <!-- #################FOOTER#################### -->

   
   <!-- --------------------------MENU BUTTON------------------------ -->
<script>
  let home=document.querySelector("#home")
  home.classList.add('hidden')
  
  let about=document.querySelector("#about")
//   about.innerText="Add Items"
//   about.href="tentwala_home_profile.do"
  about.classList.add('hidden')
  
  let services=document.querySelector("#services")
//   services.innerText="Your Items"
//   services.href="your_items.do"
  services.classList.add('hidden')
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