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
    <!-- ##############HEADER################## -->
        <c:import url="header.jsp" />
    <!-- ##############HEADER################## -->

<!-- ##############################BODY############################ -->




 <!-- Hero Section -->
 <section class="flex-1 bg-cover bg-center relative h-screen" style="background-image: url('static/images/mitchell-lawler-tbaoryUol_E-unsplash.jpg'); background-size: 150%;">
    <div class="bg-black bg-opacity-50 w-full h-full absolute"></div>
    <div class="container mx-auto flex justify-center items-center h-full px-4 relative z-10">
        <div class="text-center text-white">
            <h1 class="text-5xl font-extrabold mb-4">Time To Make Someones's Day Unforgettable</h1>
            <p class="text-lg mb-8">Premium tent house and wedding planning services</p>
            <a href="#services" class="bg-pink-600 hover:bg-pink-700 text-white py-3 px-6 rounded-lg shadow-lg transition duration-300">Explore Our Services</a>
        </div>
    </div>
</section>


<!-- Services Section -->
<section id="services" class="py-16 bg-white">
    <div class="container mx-auto px-4">
        <h2 class="text-4xl font-bold text-center text-gray-800 mb-12">Our Services</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <div class="bg-gradient-to-r from-purple-500 to-pink-500 text-white p-6 rounded-lg shadow-lg text-center">
                <h3 class="text-2xl font-semibold mb-4">Tent House Services</h3>
                <p>Elegant and spacious tents for all your event needs.</p>
            </div>
            <div class="bg-gradient-to-r from-blue-500 to-purple-500 text-white p-6 rounded-lg shadow-lg text-center">
                <h3 class="text-2xl font-semibold mb-4">Wedding Planning</h3>
                <p>Comprehensive planning services to make your wedding day perfect.</p>
            </div>
            <div class="bg-gradient-to-r from-pink-500 to-orange-500 text-white p-6 rounded-lg shadow-lg text-center">
                <h3 class="text-2xl font-semibold mb-4">Decoration Services</h3>
                <p>Stunning decorations to create the perfect ambiance.</p>
            </div>
        </div>
    </div>
</section>

<!-- About Us Section -->
<section id="about" class="py-16 bg-gray-100">
    <div class="container mx-auto px-4">
        <h2 class="text-4xl font-bold text-center text-gray-800 mb-12">About Us</h2>
        <div class="flex flex-col md:flex-row items-center">
            <div class="md:w-1/2 mb-8 md:mb-0">
                <img src="static/images/mitchell-lawler-tbaoryUol_E-unsplash.jpg" alt="About Us" class="rounded-lg shadow-lg">
            </div>
            <div class="md:w-1/2 md:pl-12">
                <p class="text-lg text-gray-700 mb-4">At TentWale, we believe in creating memorable experiences. With years of expertise in the industry, our team is dedicated to making your special day unforgettable.</p>
                <p class="text-lg text-gray-700">From elegant tent setups to comprehensive wedding planning and breathtaking decorations, we offer a full suite of services to meet all your event needs.</p>
            </div>
        </div>
    </div>
</section>

<!-- Contact Section -->




<!-- ##############################BODY############################ -->


    <!-- #################FOOTER#################### -->
    <!-- <div class="min-h-screen flex flex-col">
        <div class="fixed bottom-0 left-0 right-0"> -->
            <c:import url="footer.jsp" />
        </div>
    <!-- </div> -->
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