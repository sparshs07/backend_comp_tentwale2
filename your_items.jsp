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
  
<div class="max-w-7xl ml-32 mt-9 mb-9">
    <c:forEach var="your_item_type" items="${your_item_types}" varStatus="cn">
        <div id="accordion-collapse-${cn.count}" data-accordion="close" data-active="false">
            <h2 id="item${cn.count}">
                <button type="button" class="flex items-center justify-between w-full p-5 font-medium rtl:text-right text-gray-500 border border-b-0 border-gray-200 rounded-t-xl focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-800 dark:border-gray-700 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-800 gap-3" data-accordion-target="#accordion-collapse-body${cn.count}" aria-expanded="true" aria-controls="accordion-collapse-body${cn.count}">
                    <span></span>
                    <h3 class="text-5xl font-extrabold dark:text-white">${your_item_type.name}</h3>                
                    <svg data-accordion-icon class="w-3 h-3 rotate-180 shrink-0" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5 5 1 1 5"/>
                    </svg>
                </button>
            </h2>
            <div id="accordion-collapse-body${cn.count}" class="hidden" aria-labelledby="item${cn.count}">
                <div class="flex flex-wrap justify-start bg-gradient-to-r from-pink-300 to-purple-300">
                    <c:forEach var="tentwala_item" items="${tentwala_items}" varStatus="cm">
                        <c:if test="${your_item_type.itemTypeId==tentwala_item.item.itemType.itemTypeId}">
                            <div class="mx-5 my-8 flex flex-col  bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700 hover:shadow-2xl">
                                
                                    <img class="rounded-t-lg h-52 w-64" src="show_tentwala_pic.do?picPath=${tentwala_item.tentwalaItemPic}" alt="" />
                                
                                <div class="p-5 max-w-64 max-h-72">
                                    
                                        <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 dark:text-white">${tentwala_item.item.name}</h5>
                                    
                                    <p class="mb-3 text-wrap text-sm font-normal text-gray-700 dark:text-gray-400">${tentwala_item.item.description}</p>
                                    <p class="mb-3 text-wrap text-sm font-normal text-gray-700 dark:text-gray-400"> <b>Quantity: </b>${tentwala_item.totalQuantity}</p>
                                    <p class="mb-3 text-wrap text-sm font-normal text-gray-700 dark:text-gray-400"><b>Unit Price(Rs.): </b>${tentwala_item.unitPrice}</p>
                                    
                                    <a href="#" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                        Edit Item
                                    </a>
                                    <!-- 6/8/2024:THIS WAY IS NOT RELOADING PAGE NOW DELETE USING AJAX/JAVASCRIPT -->
                                    <a  href="#" id="delete_tentwala_item" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-red-700 rounded-lg hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                        Delete Item
                                    </a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </c:forEach>
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
    
   <!-- ------------------Display Tentwala Name in dropdown------------------ -->
   <script>
    let display_name=document.querySelector("#display_name");
    let tentwala_name="${user.tentwalaName}"
    display_name.innerHTML=tentwala_name
  </script>
  <!-- ------------------Display Tentwala Name in drop down------------------ -->

  <script>
    document.addEventListener('DOMContentLoaded', () => {
        let delete_item = document.getElementById('delete_tentwala_item');

        if (delete_item) {  // Check if the element exists
            let remove_tentwala_items = async (tentwala_item_id) => {
                try {
                    let response = await fetch('delete_tentwala_item.do?tentwala_item_id=' + encodeURIComponent(tentwala_item_id));
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    let result = await response.text();
                    return result;
                } catch (error) {
                    console.log('Fetch error: ', error);
                }
            };

            delete_item.addEventListener('click', () => {
                remove_tentwala_items(delete_item.value).then((data) => {
                    if (data === "true") {
                        window.location.reload();
                    } else {
                        console.log('Failed to delete item');
                    }
                }).catch((error) => {
                    console.log(error);
                });
            });
        }
    });
</script>



<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</body>
</html>