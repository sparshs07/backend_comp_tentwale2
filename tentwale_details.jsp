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

    <!-- ----------------BODY-------------------- -->
        <div class="container mx-auto p-8">
    
            <h1 class="text-4xl font-bold mb-6">Tentwale near you!</h1>
            
            
            
            
    
            <div class="grid grid-rows sm:grid-rows lg:grid-rows gap-8">

                <c:forEach var="tentwala_detail" items="${tentwale_details}" varStatus="cn">
                    <div class="p-2 h-24 bg-blue-50 border border-gray-200 rounded-lg shadow dark:bg-blue-800 dark:border-gray-700 hover:shadow-2xl flex flex-row justify-between">
                        <div>
                            <h2 class="text-xl font-bold mb-2">${tentwala_detail.tentwalaName}</h2>
                            <p class="text-gray-700 mb-4">${tentwala_detail.address},${pin}</p>
                        </div>
                        <div class="mt-6 mr-4">
                            <a href="show_tentwala_details.do?tentwala_id=${tentwala_detail.userId}" class=" bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-700"><b>Explore TentHouse</b></a>
                        </div>
                    </div>
                </c:forEach>

                </div>
            </div>
        </div>
    


    <!-- ----------------BODY-------------------- -->

    <!-- #################FOOTER#################### -->
    <div class="min-h-screen flex flex-col">
        <div class="fixed bottom-0 left-0 right-0">
            <c:import url="footer.jsp" />
        </div>
    </div>
    <!-- #################FOOTER#################### -->

    <script>
        let about=document.querySelector("#about")
        about.innerText="Find TentWale!"
        about.href="find_tentwale.do"

        let service=document.querySelector("#services")
        service.classList.add("hidden")
        
    </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</body>
</html>