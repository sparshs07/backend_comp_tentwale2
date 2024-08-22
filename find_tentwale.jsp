<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
    <script type='text/javascript' src='https://www.bing.com/api/maps/mapcontrol?key=AnFunKFzI3vQ2M7FKaG9AoDtG9V4dRehMHIkZAut2FhBUu5zlB37yY22xw42YTNd&callback=loadMapScenario' async defer></script>
    <style>
        #map {
            height: 400px;
        }
    </style></head>
<body>
    <!-- ##############HEADER################## -->
        <c:import url="header.jsp" />
    <!-- ##############HEADER################## -->

    <!-- ----------------BODY-------------------- -->
    
    <div class="flex flex-col w-9/12 h-1/4  mx-12 md:mx-44">

        <div id="map" class="z-0 border border-blue-500 mt-12"></div>
        
        <div class="mt-5">
            <form action="search_tentwale.do" method="post">   
                <label for="default-search" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
                <div class="relative">
                    <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                        <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="https://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
                        </svg>
                    </div>
                    <input type="search" name="pincode" id="default-search" maxlength="6" autocomplete="off" pattern="[0-9]{6}" class="block w-full p-4 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Enter 6-digit Pincode" required>
                    <button type="submit" class="text-white absolute end-2.5 bottom-2.5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Search</button>
                </div>
                    <p class="ml-2 mt-1 text-sm text-red-500 dark:text-red-300" id="no_recs">${no_records}</p>
            </form>
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
        let default_search=document.querySelector("#default-search")
        let no_recs=document.querySelector("#no_recs")
        let mapp=document.querySelector("#map");
        default_search.addEventListener('focus',()=>{
            no_recs.classList.add("hidden")
        })

        mapp.addEventListener('click',()=>{
            no_recs.classList.add("hidden")
        })
    </script>

    <!-- -----------------------MAP DIISPLAY/SELECTION-------------------- -->
    <script>
        function loadMapScenario() {
            var map = new Microsoft.Maps.Map(document.getElementById('map'), {
                credentials: 'AnFunKFzI3vQ2M7FKaG9AoDtG9V4dRehMHIkZAut2FhBUu5zlB37yY22xw42YTNd',
                center: new Microsoft.Maps.Location(23.1686, 79.9339),
                zoom: 8
            });

            // Initialize an array to store pushpins
            var pushpins = [];

            // Add a click event handler to the map
            Microsoft.Maps.Events.addHandler(map, 'click', function (e) {
                // Retrieve the location where the user clicked
                var location = e.location;

                // Check if there is already a selected pushpin
                if (pushpins.length > 0) {
                    // Remove the selected pushpin from the map
                    map.entities.remove(pushpins.pop());
                }

                // Create a pushpin at the selected location
                var pushpin = new Microsoft.Maps.Pushpin(location, {
                    title: 'Selected Location',
                    color: 'red' // You can customize the pushpin color
                });

                // Add the pushpin to the map
                map.entities.push(pushpin);

                // Store the pushpin in the array for further reference (optional)
                pushpins.push(pushpin);

                // Retrieve the postal code using Bing Maps REST API
                getPostalCode(location.latitude, location.longitude);
            });

            // Function to retrieve the postal code using Bing Maps REST API
            function getPostalCode(latitude, longitude) {
                let pincode=document.querySelector("#default-search");
                // Construct the Bing Maps REST API request URL
                var requestURL = 'https://dev.virtualearth.net/REST/v1/Locations/' + latitude + ',' + longitude +
                                 '?o=json&key=AnFunKFzI3vQ2M7FKaG9AoDtG9V4dRehMHIkZAut2FhBUu5zlB37yY22xw42YTNd';

                // Make a request to the Bing Maps REST API
                fetch(requestURL)
                    .then(response => response.json())
                    .then(data => {
                        // Extract postal code from the response
                        var postalCode = parsePostalCode(data);
                        
                        // Display the postal code in the console (you can modify this part)
                        pincode.value=postalCode;
                    })
                    .catch(error => console.error('Error:', error));
            }

            // Helper function to parse postal code from Bing Maps REST API response
            function parsePostalCode(data) {
                var postalCode = null;

                if (data.resourceSets && data.resourceSets.length > 0) {
                    var resourceSet = data.resourceSets[0];

                    if (resourceSet.resources && resourceSet.resources.length > 0) {
                        var resource = resourceSet.resources[0];

                        // Extract postal code
                        if (resource.address && resource.address.postalCode) {
                            postalCode = resource.address.postalCode;
                        }
                    }
                }

                return postalCode;
            }
        }
    </script>
    <!-- -----------------------MAP DIISPLAY/SELECTION-------------------- -->

 <!-- --------------------NAVBAR BUTTON-------------------    -->
     <script>
     let about=document.querySelector("#about")
     about.innerText="Find TentWale!"
     about.href="find_tentwale.do"
     
     let service=document.querySelector("#services")
     service.classList.add("hidden")
     
     </script>
<!-- --------------------NAVBAR BUTTON-------------------    -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</body>
</html>