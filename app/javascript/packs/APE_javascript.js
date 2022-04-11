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
    constructor(planName){
        this.planName = planName;
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
function makeAccordion() {
    var accordionHTML = "";
    $("#course-list").html(accordionHTML);
    
    $.ajax({
        url: "http://localhost:3000/requirements/1.json",
        dataType: "json",
        success: function(data){

            var coreArray = [];
            var electiveArray = [];
            var cognateArray = [];

            // Get the data from the database
            $.each(data, function (idx, val){
                if(val.category == "Core"){
                    coreArray.push(val.course_id + " " + val.name);
                }
                else if(val.category == "Electives"){
                    electiveArray.push(val.course_id + " " + val.name);
                }
                else if(val.category == "Cognates"){
                    cognateArray.push(val.course_id + " " + val.name);
                }
            });

            // Populate the accordion with the data we just got
            accordionHTML += '<h2 class="accordion-header"> Core </h2>';
            accordionHTML += '<div class=\"accordion-div\">';
            for (var i = 0; i < coreArray.length; i++) {
                accordionHTML += "<p>" + coreArray.at(i) + "</p>";
            }
            accordionHTML += '</div>';
            accordionHTML += '<h2 class = \"accordion-header\"> Electives </h2>';
            accordionHTML += '<div class=\"accordion-div\">';
            for (var i = 0; i < electiveArray.length; i++) {
                accordionHTML += "<p>" + electiveArray.at(i) + "</p>";
            }
            accordionHTML += '</div>';
            accordionHTML += '<h2 class = \"accordion-header\"> Cognates </h2>';
            accordionHTML += '<div class=\"accordion-div\">';
            for (var i = 0; i < cognateArray.length; i++) {
                accordionHTML += "<p>" + cognateArray.at(i) + "</p>";
            }
            accordionHTML += '</div>';
    
            $("#course-list").html(accordionHTML).accordion().accordion("destroy").accordion();
            //removed "header, "h2"" from accordion(__)
            
            //alert("got here");
        }
    });
}


function makeHTML(yearArray, catalog) {
    var html = "";
    var termCredits = 0;
    var planCredits = 0;
    for (var i = 0; i < yearArray.length; i++) {
        //alert(planCredits);
        html += "<div class=\"year\">";
            html += "<div class=\"semester\">";
                html += "<span class=\"period\">";
                    //added period header
                    html += "<div class =\"period-header\">";
                        //added semester title span and credits span 
                        html += "<span class =\"period-header-semester\">Fall " + yearArray.at(i).year + "</span>";
                        //alert(yearArray.at(i).year);
                        html += "<span class =\"period-header-credits\">Credits: " + parseInt(yearArray[i].fallTerm.credits) + "</span>";
                    html += "</div>";
                            //html += "<div style='width: 100%'><span>Fall " + yearArray.at(i).year + "</span>";
                            //html += "<span style='position: absolute; right: 0'>credits: 10</span></div>";
                    for (var j = 0; j < yearArray[i].fallTerm.courses.length; j++) {
                        for (var k = 0; k < catalog.courses.length; k++) {
                            if (catalog.courses[k].id == yearArray[i].fallTerm.courses[j].courseDesignator) {
                                termCredits += parseInt(catalog.courses[k].credits);
                                html += "<p class=\"course\">" + yearArray[i].fallTerm.courses[j].courseDesignator + " " +catalog.courses[k].name + "</p>";
                            }
                        }
                    }
                                
                    
                html += "</span>";
            html += "</div>";
            html += "<div class=\"semester\">";
                html += "<span class=\"period\">";
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
                                html += "<p class=\"course\">" + yearArray[i].springTerm.courses[j].courseDesignator + " " + catalog.courses[k].name + "</p>";
                            }
                        }
                    }
                html += "</span>";
            html += "</div>";
            html += "<div class=\"semester\">";
                html += "<span class=\"period\">";
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
                                html += "<p class=\"course\">" + yearArray[i].summerTerm.courses[j].courseDesignator + " " + catalog.courses[k].name + "</p>";
                            }
                        }
                    }
                html += "</span>";
            html += "</div>";
        html += "</div>";
    }

    //Update total credits in the top left
    $("#plan-credits").html(termCredits);

    var schedulesDiv = document.getElementById("schedules");
    schedulesDiv.innerHTML = html;
}

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
        html += "<tr>";
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
}

function loadCourseInfo(index) {

    // Create catalog object
    var catalog = {
        year: "",
        courses: [],
    }

    $.getJSON("1", function(data){
        var yearsArray = [];
        plansArray = [];
        
    })

    $.ajax({
        url: "1.json",
        dataType: "json",
        success: function(data){

            var yearsArray = [];
            plansArray = [];
            //alert(data.plan);
            // Pull out data relating to the plan
            $.each(data.plan, function (idx, val) {
                    // Test for if we encounter a new plan. The first plan will trigger this by default
                    var isPlanAdded = false;
                    for(i = 0; i < plansArray.length; i++){
                        if(plansArray.at(i).planName == val.plan_name){

                            // Push into different years based on terms
                            if(val.term == "Fall"){
                                plansArray.at(i).courseObjects.push(new PlanCourse(val.term, val.year, val.course_id));
                            }
                            else {
                                plansArray.at(i).courseObjects.push(new PlanCourse(val.term, val.year - 1, val.course_id));
                            }

                            isPlanAdded = true;
                            break;
                        }
                    }
                    if(!isPlanAdded){
                        plansArray.push(new Plan(val.plan_name));

                        // Push into different years based on terms
                        if(val.term == "Fall"){
                            plansArray.at(i).courseObjects.push(new PlanCourse(val.term, val.year, val.course_id));
                        }
                        else {
                            plansArray.at(i).courseObjects.push(new PlanCourse(val.term, val.year - 1, val.course_id));
                        }

                        //alert(plansArray.at(plansArray.length - 1).courseObjects.at(0).courseDesignator);
                    }
                    
                    // Test for if we encounter a year we haven't encountered yet
                    var isYearAdded = false
                    var offset = 0;
                    //alert(val.course_id + " " + val.year);
                    for(i = 0; i < yearsArray.length; i++){
                        if(val.term == 'Fall'){
                            offset = 0;
                        }
                        else{
                            offset = 1;
                        }

                        if(parseInt(yearsArray.at(i).year) == parseInt(val.year) - offset){
                            isYearAdded = true;
                            break;
                        }
                    }
                    if(!isYearAdded){
                        yearsArray.push(new Year(val.year));
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

            // Pull out data relating to the catalog
            catalog.year = data.catalog.year;        // The catalog year is consistent in each tuple, so it doesn't matter which one we pick
            $.each(data.catalog, function (idx, val) {
                    catalog.courses.push(new CatalogCourse(val.course_id, val.name, val.description, val.credits));
            });

            convertPlanToYear(plansArray.at(index).courseObjects, yearsArray, catalog);
            makeAccordion();
            makeHTML(yearsArray, catalog);
            makeCatalogDiv(catalog);
            //alert("Got to the end");
        }

    });
}