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
<body class="flex flex-col min-h-screen">
    <!-- ##############HEADER################## -->
    <c:import url="header.jsp" />
    <!-- ##############HEADER################## -->

    <!-- ----------------BODY-------------------- -->
    <main class="flex-grow">
        <section class="bg-center bg-no-repeat bg-[url('static/images/ray-hennessy-gdTxVSAE5sk-unsplash.jpg')] bg-gray-700 bg-blend-multiply">
            <div class="mx-auto max-w-screen-xl text-center py-24 lg:py-56 px-4 sm:px-6 lg:px-8">
                <h1 class="mb-4 text-4xl font-extrabold tracking-tight leading-none text-white md:text-5xl lg:text-6xl">Let's start the tentwala journey!</h1>
                <p class="mb-8 text-lg font-normal text-gray-300 lg:text-xl sm:px-16 lg:px-48">Spark Smiles, Share Shine: Contribute to Special Days, Create Lasting Memories.</p>
                <div class="flex flex-col space-y-4 sm:flex-row sm:justify-center sm:space-y-0">
                    <a href="tentwala_signup.do" class="inline-flex justify-center items-center py-3 px-5 text-base font-medium text-center text-white rounded-lg bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 dark:focus:ring-blue-900">
                        Get started
                        <svg class="w-3.5 h-3.5 ms-2 rtl:rotate-180" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9"/>
                        </svg>
                    </a>
                    <a href="#" class="inline-flex justify-center hover:text-gray-900 items-center py-3 px-5 sm:ms-4 text-base font-medium text-center text-white rounded-lg border border-white hover:bg-gray-100 focus:ring-4 focus:ring-gray-400">
                        Learn more
                    </a>
                </div>
            </div>
        </section>
    </main>

    <!-- ----------------BODY-------------------- -->

    <!-- #################FOOTER#################### -->
    <!-- <div class="min-h-screen flex flex-col">
        <div class="fixed bottom-0 left-0 right-0"> -->
            <c:import url="footer.jsp" />
        <!-- </div>
    </div> -->
    <!-- #################FOOTER#################### -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</body>
</html>