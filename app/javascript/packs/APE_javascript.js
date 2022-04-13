$(document).ready(startup);

var $plansArray = [];

// A series of things to do to set up the page
function startup(){
    $('#catalog_table').DataTable();
    $('#log-out-button').click(function (){
        window.location.replace("4 - login.php");
        
    });

    loadCourseInfo(0);
}

function switchPlans(){
    //alert($(this).attr("name"));
    if($(this).attr("name") != $("#dropdown-header").attr("name")){
        $("#dropdown-header").html("Plan " + $(this).attr("name")).attr("name", $(this).attr("name"));
        
        loadCourseInfo($(this).attr("name") - 1);
    }
}

//function to create Course objects

class Plan {
    constructor(planName, major, catalog, firstName, lastName, req){
        this.planName = planName;
        this.major = major;
        this.catalog = catalog;
        this.firstName = firstName;
        this.lastName = lastName;
        this.req_id = req;
        this.courseObjects = [];
    }
}

class PlanCourse {
    constructor(courseTerm, courseYear, courseDesignator) {
        this.courseTerm = courseTerm;
        this.courseYear = courseYear;
        this.courseDesignator = courseDesignator;
    }
}

class CatalogCourse {
    constructor(id, name, description, credits) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.credits = credits;
    }
}

//function defining year object
class Year {
    constructor(year) {
        this.year = year;
        this.fallTerm = new Term();
        this.springTerm = new Term();
        this.summerTerm = new Term();
    }
}

//function defining Term objects
class Term {
    constructor() {
        this.courses = [];
        this.credits = 0;
    }
}

//function to convert course objects to year objects
function convertPlanToYear(courseArray, yearArray, catalog) {
    //alert(courseArray.length);
    //zero out credit counts
    //alert(courseArray.at(0).courseDesignator + " " + courseArray.at(0).courseTerm);
    for (var i = 0; i < yearArray.length; i++) {
        yearArray[i].fallTerm.credits = 0;
        yearArray[i].springTerm.credits = 0;
        yearArray[i].summerTerm.credits = 0;
    }

    for (var i = 0; i < courseArray.length; i++) {
        //alert(courseArray[i].courseTerm);
        if (courseArray[i].courseTerm == "Fall") {
            //alert("Fall");
            for(j = 0; j < yearArray.length; j++){
                if (courseArray[i].courseYear == parseInt(catalog.year) + j) {
                    yearArray[j].fallTerm.courses.push(courseArray[i]);
                    for (k = 0; k < catalog.courses.length; k++) {
                        if (courseArray[i].courseDesignator == catalog.courses[k].id) {
                            yearArray[j].fallTerm.credits += parseInt(catalog.courses[k].credits);
                            break;
                        }
                    }
                }
            }
        }
        else if (courseArray[i].courseTerm == "Spring") {
            //alert("Spring");
            for(j = 0; j < yearArray.length; j++){
                if (courseArray[i].courseYear == parseInt(catalog.year) + j) {
                    yearArray[j].springTerm.courses.push(courseArray[i]);
                    for (k = 0; k < catalog.courses.length; k++) {
                        if (courseArray[i].courseDesignator == catalog.courses[k].id) {
                            yearArray[j].springTerm.credits += parseInt(catalog.courses[k].credits);
                            break;
                        }
                    }
                }
            }
        }
        else if (courseArray[i].courseTerm == "Summer") {
            //alert("Summer");
            for(j = 0; j < yearArray.length; j++){
                if (courseArray[i].courseYear == parseInt(catalog.year) + j) {
                    yearArray[j].summerTerm.courses.push(courseArray[i]);
                    for (k = 0; k < catalog.courses.length; k++) {
                        if (courseArray[i].courseDesignator == catalog.courses[k].id) {
                            yearArray[j].summerTerm.credits += parseInt(catalog.courses[k].credits);
                            break;
                        }
                    }
                }
            }
        }


    }
}

//function to make accordion of course requirements
//gets course ids and matches them to course names in the catalog
function makeAccordion(req_id) {
    var accordionHTML = "";
    $("#course-list").html(accordionHTML);
    var accordionURL = "http://localhost:3000/requirements/" + parseInt(req_id) + ".json";
    $.ajax({
        url: accordionURL,
        dataType: "json",
        success: function(data){

            var coreArray = [];
            var electiveArray = [];
            var cognateArray = [];

            // Get the data from the database
            $.each(data.categories, function (idx, val){
                if(val.name == "Core"){
                    for(i = 0; i < val.courses.length; i++) {
                        coreArray.push(val.courses.at(i).designator + " " + val.courses.at(i).title);
                    }      
                }
                else if(val.name == "Electives"){
                    for(i = 0; i < val.courses.length; i++) {
                        electiveArray.push(val.courses.at(i).designator + " " + val.courses.at(i).title);
                    } 
                }
                else if(val.name == "Cognates"){
                    for(i = 0; i < val.courses.length; i++) {
                        cognateArray.push(val.courses.at(i).designator + " " + val.courses.at(i).title);
                    } 
                }
            });

            // Populate the accordion with the data we just got
            accordionHTML += '<h2 class="accordion-header"> Core </h2>';
            accordionHTML += '<div class=\"accordion-div\">';
            for (var i = 0; i < coreArray.length; i++) {
                //accordionHTML += "<p>" + coreArray.at(i) + "</p>";
                accordionHTML += "<p courseName='" + coreArray.at(i) + "' draggable='true' ondragstart='dragStart(event)'><img class='req-status' src='/assets/x-icon.png'/> " + coreArray.at(i) + "</p>";

            }
            accordionHTML += '</div>';
            accordionHTML += '<h2 class = \"accordion-header\"> Electives </h2>';
            accordionHTML += '<div class=\"accordion-div\">';
            for (var i = 0; i < electiveArray.length; i++) {
                //accordionHTML += "<p>" + electiveArray.at(i) + "</p>";
                accordionHTML += "<p courseName='" + electiveArray.at(i) + "' draggable='true' ondragstart='dragStart(event)'><img class='req-status' src='/assets/x-icon.png'/> " + electiveArray.at(i) + "</p>";
            }
            accordionHTML += '</div>';
            accordionHTML += '<h2 class = \"accordion-header\"> Cognates </h2>';
            accordionHTML += '<div class=\"accordion-div\">';
            for (var i = 0; i < cognateArray.length; i++) {
                //accordionHTML += "<p>" + cognateArray.at(i) + "</p>";
                accordionHTML += "<p courseName='" + cognateArray.at(i) + "' draggable='true' ondragstart='dragStart(event)'><img class='req-status' src='/assets/x-icon.png'/> " + cognateArray.at(i) + "</p>";
            }
            accordionHTML += '</div>';
    
            $("#course-list").html(accordionHTML).accordion().accordion("destroy").accordion();
            //removed "header, "h2"" from accordion(__)
            
            //alert("got here");

            updateSatisfiedRequirements();
        }
    });
}

// Adds a check or an x next to each course in the accordion based on if it's satisfied in the plan or not.
function updateSatisfiedRequirements() {

    // Go through every course in the accordion
    $("#course-list p").each(function(){
        isSatisfied = false;
        requiredClass = $(this);

        // Compare each course in the accordion with each course in the plan
        $("#schedules p.course").each(function(){

            // If the required course is found anywhere in the plan, it is satisfied
            if(requiredClass.attr("courseName") == $(this).attr("courseName")){

                requiredClass.find("img").attr("src", "/assets/check-icon.png");
                isSatisfied = true;
                return;
            }
        });

        if(!isSatisfied){
            requiredClass.find("img").attr("src", "/assets/x-icon.png");
        }
    });
}

// Updates the credits values in each semester and the total credits in the header
function updateCredits(){
    semesterCredits = 0;
    planCredits = 0;

    // Go through each semester
    $("div.semester").each(function(){
        semesterCredits = 0;

        // Go through each course in a given semester
        $(this).find("p.course").each(function(){
            semesterCredits += parseInt($(this).attr("credits"));
        });

        $(this).find(".period-header-credits").html("Credits: " + semesterCredits);

        planCredits += semesterCredits;
    });

    //Update total credits in the top left
    $("#plan-credits").html(planCredits);
}


function makeHTML(yearArray, catalog, major, studentName) {
    var html = "";
    var termCredits = 0;
    // alert("first year fall term");
    // alert(yearArray.at(0).fallTerm.courses.at(0).courseDesignator);
    // alert("first year fall term second course");
    // alert(yearArray.at(0).fallTerm.courses.at(1).courseDesignator);
    // alert("first year fall term third course");
    // alert(yearArray.at(0).fallTerm.courses.at(2).courseDesignator);
    // alert("first year fall term fourth course");
    // alert(yearArray.at(0).fallTerm.courses.at(3).courseDesignator);
    // alert("courses in first year fall term:");
    // alert(yearArray.at(0).fallTerm.courses.length);
    // alert("second year fall term");
    // alert(yearArray.at(1).fallTerm.courses.at(0).courseDesignator);


    // alert("number of years");
    // alert(yearArray.length);
    // for (i = 0; i < yearArray.length; i++) {
    //     alert("Fall, year " + parseInt(i) + " course count");
    //     alert(yearArray.at(i).fallTerm.courses.length);
    //     for (j = 0; j < yearArray.at(i).fallTerm.courses.length; j++) {
    //         alert("Fall, year " + parseInt(i) + " course " + parseInt(j));
    //         alert(yearArray.at(i).fallTerm.courses.at(j).courseDesignator);
    //     }
    //     alert("Spring, year " + parseInt(i) + " course count");
    //     alert(yearArray.at(i).springTerm.courses.length);
    //     for (j = 0; j < yearArray.at(i).springTerm.courses.length; j++) {
    //         alert("Spring, year " + parseInt(i) + " course " + parseInt(j));
    //         alert(yearArray.at(i).springTerm.courses.at(j).courseDesignator);
    //     }
    //     alert("Summer, year " + parseInt(i) + " course count");
    //     alert(yearArray.at(i).summerTerm.courses.length);
    //     for (j = 0; j < yearArray.at(i).summerTerm.courses.length; j++) {
    //         alert("Summer, year " + parseInt(i) + " course " + parseInt(j));
    //         alert(yearArray.at(i).summerTerm.courses.at(j).courseDesignator);
    //     }
    // }
    //var planCredits = 0;

    // var coursesPrinted = {
    //     year: "",
    //     courses: [],
    // }
    for (var i = 0; i < yearArray.length; i++) {
        //alert(planCredits);
        html += "<div class=\"year\">";
            html += "<div class=\"semester\">";
                html += "<span class=\"period\" ondragover='dragover(event)' ondrop='drop(event)'>";
                    //added period header
                    html += "<div class =\"period-header\">";
                        //added semester title span and credits span 
                        html += "<span class =\"period-header-semester\">Fall " + yearArray.at(i).year + "</span>";
                        //alert(yearArray.at(i).year);
                        html += "<span class =\"period-header-credits\">Credits: " + parseInt(yearArray[i].fallTerm.credits) + "</span>";
                    html += "</div>";
                            //html += "<div style='width: 100%'><span>Fall " + yearArray.at(i).year + "</span>";
                            //html += "<span style='position: absolute; right: 0'>credits: 10</span></div>";
                    //alert("Fall " + parseInt(i) + " courses to be printed:")
                    //alert(yearArray.at(i).fallTerm.courses.length);
                    for (var j = 0; j < yearArray[i].fallTerm.courses.length; j++) {
                        for (var k = 0; k < catalog.courses.length; k++) {
                            if (catalog.courses[k].id == yearArray[i].fallTerm.courses[j].courseDesignator) {
                                //alert("writing html for fall, year: " + parseInt(i) +" course: " + parseInt(j) + " catalog course: " +parseInt(k));
                                termCredits += parseInt(catalog.courses[k].credits);
                                //html += "<p class=\"course\">" + yearArray[i].fallTerm.courses[j].courseDesignator + " " +catalog.courses[k].name + "</p>";
                                credits = parseInt(catalog.courses[k].credits);
                                courseName = yearArray[i].fallTerm.courses[j].courseDesignator + " " + catalog.courses[k].name;
                                html += "<div class='courseWrapper'>"
                                    +       "<p class='course' courseName='" + courseName + "' credits='" + credits + "'>"
                                    +           courseName 
                                    +           "<img class='del-course' src='/assets/x-icon.png'/>"
                                    //C:\Users\under\railsProjects\Ape\public\check-icon.png
                                    +       "</p>"
                                    +   "</div>";

                            }
                        }
                    }
                                
                    
                html += "</span>";
            html += "</div>";
            html += "<div class=\"semester\">";
                html += "<span class=\"period\" ondragover='dragover(event)' ondrop='drop(event)'>";
                    //added period header
                    html += "<div class =\"period-header\">";
                        //added semester title span and credits span 
                        html += "<span class =\"period-header-semester\">Spring " + (parseInt(yearArray.at(i).year) + 1) + "</span>";
                        html += "<span class =\"period-header-credits\">Credits: " + parseInt(yearArray[i].springTerm.credits) + "</span>";
                    html += "</div>";
                    //html += "Spring " + (parseInt(yearArray.at(i).year) + 1);
                    for (var j = 0; j < yearArray[i].springTerm.courses.length; j++) {
                        for (var k = 0; k < catalog.courses.length; k++) {
                            if (catalog.courses[k].id == yearArray[i].springTerm.courses[j].courseDesignator) {
                                termCredits += parseInt(catalog.courses[k].credits);
                                //html += "<p class=\"course\">" + yearArray[i].springTerm.courses[j].courseDesignator + " " + catalog.courses[k].name + "</p>";
                                credits = parseInt(catalog.courses[k].credits);
                                courseName = yearArray[i].springTerm.courses[j].courseDesignator + " " + catalog.courses[k].name;
                                html += "<div class='courseWrapper'>"
                                    +      "<p class='course' courseName='" + courseName + "' credits='" + credits + "'>"
                                    +          courseName 
                                    +          "<img class='del-course' src='/assets/x-icon.png'/>"
                                    +      "</p>"
                                    +   "</div>";

                            }
                        }
                    }
                html += "</span>";
            html += "</div>";
            html += "<div class=\"semester\">";
                html += "<span class=\"period\" ondragover='dragover(event)' ondrop='drop(event)'>";

                    //added period header
                    html += "<div class =\"period-header\">";
                        //added semester title span and credits span 
                        html += "<span class =\"period-header-semester\">Summer " + (parseInt(yearArray.at(i).year) + 1) + "</span>";
                        html += "<span class =\"period-header-credits\">Credits: " + parseInt(yearArray[i].summerTerm.credits) + "</span>";
                    html += "</div>";
                    //html += "Summer " + (parseInt(yearArray.at(i).year) + 1);
                    for (var j = 0; j < yearArray[i].summerTerm.courses.length; j++) {
                        for (var k = 0; k < catalog.courses.length; k++) {
                            if (catalog.courses[k].id == yearArray[i].summerTerm.courses[j].courseDesignator) {
                                termCredits += parseInt(catalog.courses[k].credits);
                                //html += "<p class=\"course\">" + yearArray[i].summerTerm.courses[j].courseDesignator + " " + catalog.courses[k].name + "</p>";
                                credits = parseInt(catalog.courses[k].credits);
                                courseName = yearArray[i].summerTerm.courses[j].courseDesignator + " " + catalog.courses[k].name;
                                html += "<div class='courseWrapper'>"
                                    +       "<p class='course' courseName='" + courseName + "' credits='" + credits + "'>" 
                                    +           courseName 
                                    +           "<img class='del-course' src='/assets/x-icon.png'/>"
                                    +       "</p>"
                                    +   "</div>";

                            }
                        }
                    }
                html += "</span>";
            html += "</div>";
        html += "</div>";
    }

    //Update total credits in the top left
    $("#plan-credits").html(termCredits);
    //update other top left info
    $("#student-name").html(studentName);
    $("#show-catalog").html(parseInt(catalog.year));
    $("#show-major").html(major);

    // Populate the plan divs
    //$("#schedules").html(html);

    
    


    var schedulesDiv = document.getElementById("schedules");
    schedulesDiv.innerHTML = html;

    // Calculate credits
    updateCredits();

    // Add delete on click functionality
    $(".del-course").click(function(){
        $(this).parent().parent().remove();
        updateSatisfiedRequirements();
        updateCredits();
    });

}

//window.makeHTML = makeHTML;

function makeCatalogDiv(catalog) {
    var html = "";
    html += "<div>"
    html += "</div>";
    html += "<table id= \"catalog_table\" class=\"catalogDisplay\">";
    html += "<thead>";
    html += "<tr>";
    html += "<th>ID</th>";
    html += "<th>Name</th>";
    html += "<th>Description</th>";
    html += "<th>Credits</th>";
    html += "</tr>";
    html += "</thead>";
    html += "<tbody>";

    for (var i = 0; i < catalog.courses.length; i++) {
        //html += "<tr>";
        html += "<tr draggable='true' class='catalog-course' courseName='" + catalog.courses[i].id + " " + catalog.courses[i].name + "' credits ='" + catalog.courses[i].credits + "''>";
        html += "<td>" + catalog.courses[i].id + "</td>";
        html += "<td>" + catalog.courses[i].name + "</td>";
        html += "<td>" + catalog.courses[i].description + "</td>";
        html += "<td>" + catalog.courses[i].credits + "</td>";
        html += "</tr>";
    }
    html += "</tbody>";
    html += "</table>";
    var courseFinderDiv = document.getElementById("course-finder");
    courseFinderDiv.innerHTML = html;

    //$("#course-finder").html(html);
}

//window.makeCatalogDiv = makeCatalogDiv;

function loadCourseInfo(index) {

    // Create catalog object
    var catalog = {
        year: "",
        courses: [],
    }
    var ajaxURL = parseInt(index + 1) + ".json";

    $.ajax({
        url: ajaxURL,
        dataType: "json",
        success: function(data){

            var yearsArray = [];
            plansArray = [];
            //alert(data.plan);
            // Pull out data relating to the plan
            $.each(data.plans, function (idx, val) {
                // Test for if we encounter a new plan. The first plan will trigger this by default
                //alert(val.courses.at(0).designator);
                //alert(val.courses.at(1).designator);
                var isPlanAdded = false;
                //alert(val.courses.at(0).term);
                // for(i = 0; i < plansArray.length; i++){
                    
                //     if(plansArray.at(i).planName == val.plan_name){

                //         // Push into different years based on terms
                        
                //         for(j = 0; j < val.courses.length; i++) {
                //             //push into appropriate term and year
                //             if (val.courses.at(j).term == "Fall") {
                //                 plansArray.at(i).courseObjects.push(new PlanCourse(val.courses.at(j).term, val.courses.at(j).year, val.courses.at(j).designator));
                //             }
                //             else {
                //                 plansArray.at(i).courseObjects.push(new PlanCourse(val.courses.at(j).term, val.courses.at(j).year-1, val.courses.at(j).designator));
                //             }
                //             // Test for if we encounter a year we haven't encountered yet
                //             var isYearAdded = false
                //             var offset = 0;
                //             for(k = 0; k < yearsArray.length; k++){
                //                 if(val.courses.at(j).term == 'Fall'){
                //                     offset = 0;
                //                 }
                //                 else{
                //                     offset = 1;
                //                 }
        
                //                 if(parseInt(yearsArray.at(k).year) == parseInt(val.courses.at(j).year) - offset){
                //                     isYearAdded = true;
                //                     break;
                //                 }
                //             }
                //             if(!isYearAdded){
                //                 yearsArray.push(new Year(val.courses.at(j).year - offset));
                //             }
                //         }
                //         //if we have added the plan with the index we want to display, 
                //         //pull the catalog for that plan so it can alsod be displayed
                //         if (plansArray.length == index + 1) {
                //             if (val.catalog.year == plansArray.at(index).catalog) {
                //                 catalog.year = val.catalog.year;
                //                 $.each(val.catalog.courses, function (idx, val) {
                //                     catalog.courses.push(new CatalogCourse(val.designator, val.name, val.description, val.credit));
                //                 });
                //             } 
                //         }                            

                //         isPlanAdded = true;
                //         break;
                //     }

                // }
                if(!isPlanAdded){                        
                    plansArray.push(new Plan(val.plan_name, val.major, val.catalog.year, val.first_name, val.last_name, val.requirement_id));
                    
                    //alert(plansArray.at(0).plan_name);
                    //add courses
                    for(j = 0; j < val.courses.length; j++) {
                        //push into appropriate term and year
                        if (val.courses.at(j).term == "Fall") {

                            //isCourseAdded = false;
                            // for(m=0; m < plansArray.at(plansArray.length -1).courseObjects.length; m++) {
                            //     if (plansArray.at(plansArray.length -1).courseObjects.at(m).designator == val.courses.at(j).designator) {
                            //         isCourseAdded = true;
                            //         break;
                            //     }
                            // }

                            //if (!isCourseAdded) {
                            plansArray.at(plansArray.length -1).courseObjects.push(new PlanCourse(val.courses.at(j).term, val.courses.at(j).year, val.courses.at(j).designator));
                            //}
                        }
                        else {                                
                            plansArray.at(plansArray.length -1).courseObjects.push(new PlanCourse(val.courses.at(j).term, val.courses.at(j).year-1, val.courses.at(j).designator));
                        }
                        // Test for if we encounter a year we haven't encountered yet
                        var isYearAdded = false
                        var offset = 0;
                        for(k = 0; k < yearsArray.length; k++){
                            if(val.courses.at(j).term == 'Fall'){
                                offset = 0;
                            }
                            else{
                                offset = 1;
                            }
    
                            if(parseInt(yearsArray.at(k).year) == parseInt(val.courses.at(j).year) - offset){
                                isYearAdded = true;
                                break;
                            }
                        }
                        if(!isYearAdded){
                            //alert(parseInt(offset));
                            yearsArray.push(new Year(val.courses.at(j).year - offset));
                        }

                    }
                    //if we have added the plan with the index we want to display, 
                    //pull the catalog for that plan so it can also be displayed
                    if (plansArray.length == index + 1) {
                        if (val.catalog.year == plansArray.at(index).catalog) {
                            catalog.year = val.catalog.year;
                            $.each(val.catalog.courses, function (idx, val) {
                                catalog.courses.push(new CatalogCourse(val.designator, val.name, val.description, val.credit));
                            });
                        } 
                    }
                    
                }
                                   
            });
            
            // Sort the years array
            yearsArray.sort(function(a, b) {
              return a.year - b.year;
            });

            // Populate the plans dropdown menu
            var plansString = "";
            
            $("#dropdown-content").html("<p>New plan</p>");
            for(i = 0; i < plansArray.length; i++){
                //alert(plansArray.at(i).planName);
                plansString += "<p class='plan-option' id='plan-" + (i+1) + "' name='" + (i+1) + "'>Plan " + (i + 1) + "</p>";
            }
            $("#dropdown-content").prepend(plansString);
            $(".plan-option").click(switchPlans);
            //alert(plansArray.at(0).courseObjects.length);
            //alert(catalog.courses.length);
            var fullName = plansArray.at(index).firstName + " " + plansArray.at(index).lastName;
            convertPlanToYear(plansArray.at(index).courseObjects, yearsArray, catalog);
            makeAccordion(plansArray.at(index).req_id);
            makeHTML(yearsArray, catalog, plansArray.at(index).major, fullName);
            makeCatalogDiv(catalog);
            //alert("Got to the end");
        }

    });
}

window.loadCourseInfo = loadCourseInfo;



function dragStart(e) {
    e.dataTransfer.setData("courseName", e.target.getAttribute("courseName"));
    //alert(e.target.getAttribute("courseName"));

    // When dragging from the accordion, the credits aren't saved in the course so they have to be found
    if(e.target.getAttribute("credits") == null){
        $(".catalog-course").each(function(){
            if($(this).attr("courseName") == e.target.getAttribute("courseName")){

                // Set it as the event's credits
                e.dataTransfer.setData("credits", $(this).attr("credits"));
                return;
            }
        });
    }
    else{
        e.dataTransfer.setData("credits", e.target.getAttribute("credits"))
    }
}

window.dragStart = dragStart;

function dragover(e) {
    e.preventDefault();
}

window.dragover = dragover;

function drop(e) {
    courseName = e.dataTransfer.getData("courseName");
    credits = e.dataTransfer.getData("credits");
    //alert(credits);

    courseHTML = "<div class='courseWrapper'>"
    +       "<p class='course' courseName='" + courseName + "' credits='" + credits + "'>"
    +           courseName 
    +           "<img class='del-course' src='/assets/x-icon.png'/>"
    +       "</p>"
    +   "</div>";
    
    $(e.target).append(courseHTML);

    // Add delete on click functionality
    $(".del-course").click(function(){
        $(this).parent().parent().remove();
        updateSatisfiedRequirements();
        updateCredits();
    });

    // Update everything
    updateSatisfiedRequirements();
    updateCredits();
}

window.drop = drop;