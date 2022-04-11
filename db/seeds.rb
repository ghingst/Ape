# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create majors
majorCS = Major.new;
majorCS.name = "Computer Science";
majorCS.save!

majorCPE = Major.new;
majorCPE.name = "Computer Engineering";
majorCPE.save!

#create catalogs
catalog1 = Catalog.new;
catalog1.year = 2019;
catalog1.save!

catalog2 = Catalog.new;
catalog2.year = 2020;
catalog2.save!

# create users
userCS = User.new;
userCS.login = "CSuser";
userCS.email = "CSuser@cedarville.edu";
userCS.password = "CSpassword";
userCS.password_confirmation = "CSpassword";
userCS.major_id = majorCS.id;
userCS.catalog_id = catalog1.id;
userCS.first_name = "Patrick";
userCS.last_name = "Dudenhofer";
userCS.save!

userCPE = User.new;
userCPE.login = "CPEuser";
userCPE.email = "CPEuser@cedarville.edu";
userCPE.password = "CPEpassword";
userCPE.password_confirmation = "CPEpassword";
userCPE.major_id = majorCPE.id;
userCPE.catalog_id = catalog2.id;
userCPE.first_name = "Vicky";
userCPE.last_name = "Fang";
userCPE.save!

#create requirements
reqCS2019 = Requirement.new;
reqCS2019.major_id = majorCS.id;
reqCS2019.catalog_id = catalog1.id;
reqCS2019.save!

reqCS2020 = Requirement.new;
reqCS2020.major_id = majorCS.id;
reqCS2020.catalog_id = catalog2.id;
reqCS2020.save!

reqCPE2019 = Requirement.new;
reqCPE2019.major_id = majorCPE.id;
reqCPE2019.catalog_id = catalog1.id;
reqCPE2019.save!

reqCPE2020 = Requirement.new;
reqCPE2020.major_id = majorCPE.id;
reqCPE2020.catalog_id = catalog2.id;
reqCPE2020.save!

#create categories
catCScore1 = Category.new;
catCScore1.name = "Core";
catCScore1.requirement_id = reqCS2019.id;
catCScore1.save!

catCScognates1 = Category.new;
catCScognates1.name = "Cognates";
catCScognates1.requirement_id = reqCS2019.id;
catCScognates1.save!

catCSelectives1 = Category.new;
catCSelectives1.name = "Electives";
catCSelectives1.requirement_id = reqCS2019.id;
catCSelectives1.save!

catCScore2 = Category.new;
catCScore2.name = "Core";
catCScore2.requirement_id = reqCS2020.id;
catCScore2.save!

catCScognates2 = Category.new;
catCScognates2.name = "Cognates";
catCScognates2.requirement_id = reqCS2020.id;
catCScognates2.save!

catCSelectives2 = Category.new;
catCSelectives2.name = "Electives";
catCSelectives2.requirement_id = reqCS2020.id;
catCSelectives2.save!

catCPEcore1 = Category.new;
catCPEcore1.name = "Core";
catCPEcore1.requirement_id = reqCPE2019.id;
catCPEcore1.save!

catCPEcognates1 = Category.new;
catCPEcognates1.name = "Cognates";
catCPEcognates1.requirement_id = reqCPE2019.id;
catCPEcognates1.save!

catCPEcore2 = Category.new;
catCPEcore2.name = "Core";
catCPEcore2.requirement_id = reqCS2020.id;
catCPEcore2.save!

catCPEcognates2 = Category.new;
catCPEcognates2.name = "Cognates";
catCPEcognates2.requirement_id = reqCS2020.id;
catCPEcognates2.save!

# create courses
courseBTGE1000 = Course.new;
courseBTGE1000.name = "Bible and the Gospel";
courseBTGE1000.credits = 3;
courseBTGE1000.description = "Introduction to the Gospel";
courseBTGE1000.designator = "BTGE-1000";
courseBTGE1000.save!

courseCHEM1050 = Course.new;
courseCHEM1050.designator = "CHEM-1050";
courseCHEM1050.name = "Chemistry";
courseCHEM1050.credits = 3;
courseCHEM1050.description = "Bedroom Course";
courseCHEM1050.save!

courseCS1210 = Course.new;
courseCS1210.name = "C++ Programming";
courseCS1210.credits = 2;
courseCS1210.description = "Feeble effort to teach programming";
courseCS1210.designator = "CS-1210";
courseCS1210.save!

courseCS1220 = Course.new;
courseCS1220.name = "OOD with C++";
courseCS1220.credits = 3;
courseCS1220.description = "Why do we still teach C++";
courseCS1220.designator = "CS-1220";
courseCS1220.save!

courseCS2210 = Course.new;
courseCS2210.designator = "CS-2210";
courseCS2210.name = "Data Structures using Java";
courseCS2210.credits = 3;
courseCS2210.description = "What an awesome prof!!!!";
courseCS2210.save!

courseCS3220 = Course.new;
courseCS3220.designator = "CS-3220";
courseCS3220.name = "Web Apps";
courseCS3220.credits = 3;
courseCS3220.description = "Who won the Medal of Honor at Gettysburg";
courseCS3220.save!

courseCS3310 = Course.new;
courseCS3310.designator = "CS-3310";
courseCS3310.name = "Operating Systems";
courseCS3310.credits = 3;
courseCS3310.description = "Forget Windows; Let's do Linux!";
courseCS3310.save!

courseCS3410 = Course.new;
courseCS3410.designator = "CS-3410";
courseCS3410.name = "Algorithms";
courseCS3410.credits = 3;
courseCS3410.description = "The heart of Computer Science";
courseCS3410.save!

courseCS3510 = Course.new;
courseCS3510.designator = "CS-3510";
courseCS3510.name = "I Love DSZQUP";
courseCS3510.credits = 3;
courseCS3510.description = "Foundations of Computer Security";
courseCS3510.save!

courseCS3520 = Course.new;
courseCS3520.designator = "CS-3520";
courseCS3520.name = "Compiler Theory and Practice";
courseCS3520.credits = 3;
courseCS3520.description = "The BEST! Way Cool!";
courseCS3520.save!

courseCS3610 = Course.new;
courseCS3610.designator = "CS-3610";
courseCS3610.name = "Database Organization and Design";
courseCS3610.credits = 3;
courseCS3610.description = "Prof dude's Database crash course";
courseCS3610.save!

courseCS4330 = Course.new;
courseCS4330.designator = "CS-4330";
courseCS4330.name = "Software Security";
courseCS4330.credits = 3;
courseCS4330.description = "buffer overflow";
courseCS4330.save!

courseCS4410 = Course.new;
courseCS4410.designator = "CS-4410";
courseCS4410.name = "Parallel Computing";
courseCS4410.credits = 3;
courseCS4410.description = "Impossible";
courseCS4410.save!

courseCS4710 = Course.new;
courseCS4710.designator = "CS-4710";
courseCS4710.name = "Computer Graphics";
courseCS4710.credits = 3;
courseCS4710.description = "Just games";
courseCS4710.save!

courseCS4810 = Course.new;
courseCS4810.designator = "CS-4810";
courseCS4810.name = "Software Engineering I";
courseCS4810.credits = 3;
courseCS4810.description = "Love Senior Design!";
courseCS4810.save!

courseCS4820 = Course.new;
courseCS4820.designator = "CS-4820";
courseCS4820.name = "Software Engineering II";
courseCS4820.credits = 4;
courseCS4820.description = "Love Senior Design!";
courseCS4820.save!

courseCY2210 = Course.new;
courseCY2210.designator = "CY-2210";
courseCY2210.name = "Intro to cybersecurity";
courseCY2210.credits = 3;
courseCY2210.description = "Basics of cybersecurity";
courseCY2210.save!

courseCY3210 = Course.new;
courseCY3210.designator = "CY-3210";
courseCY3210.name = "Cyber Defense";
courseCY3210.credits = 3;
courseCY3210.description = "Advanced Cybersecurity";
courseCY3210.save!

courseCY4310 = Course.new;
courseCY4310.designator = "CY-4310";
courseCY4310.name = "Cyber Operations";
courseCY4310.credits = 3;
courseCY4310.description = "Attack!";
courseCY4310.save!

courseEGCP1010 = Course.new;
courseEGCP1010.designator = "EGCP-1010";
courseEGCP1010.name = "Digital Logic Design";
courseEGCP1010.credits = 3;
courseEGCP1010.description = "Cool course with AND, OR, and NOT";
courseEGCP1010.save!

courseEGCP2120 = Course.new;
courseEGCP2120.designator = "EGCP-2120";
courseEGCP2120.name = "Microcontrollers";
courseEGCP2120.credits = 3;
courseEGCP2120.description = "really long labs";
courseEGCP2120.save!

courseEGCP3010 = Course.new;
courseEGCP3010.designator = "EGCP-3010";
courseEGCP3010.name = "Advanced Digital Logic Design";
courseEGCP3010.credits = 3;
courseEGCP3010.description = "I AM ROBOT!";
courseEGCP3010.save!

courseEGCP3210 = Course.new;
courseEGCP3210.designator = "EGCP-3210";
courseEGCP3210.name = "Computer Architecture";
courseEGCP3210.credits = 3;
courseEGCP3210.description = "Build the Pipeline";
courseEGCP3210.save!

courseEGCP4210 = Course.new;
courseEGCP4210.designator = "EGCP-4210";
courseEGCP4210.name = "Advanced Computer Architecture";
courseEGCP4210.credits = 3;
courseEGCP4210.description = "We love Tomasulo";
courseEGCP4210.save!

courseEGCP4310 = Course.new;
courseEGCP4310.designator = "EGCP-4310";
courseEGCP4310.name = "Computer Networks";
courseEGCP4310.credits = 3;
courseEGCP4310.description = "Networking is very importing for finding a job";
courseEGCP4310.save!

courseEGCP4810 = Course.new;
courseEGCP4810.designator = "EGCP-4810";
courseEGCP4810.name = "Senior Design I";
courseEGCP4810.credits = 4;
courseEGCP4810.description = "home stretch";
courseEGCP4810.save!

courseEGCP4820 = Course.new;
courseEGCP4820.designator = "EGCP-4820";
courseEGCP4820.name = "Senior Design II";
courseEGCP4820.credits = 4;
courseEGCP4820.description = "nearly graduated";
courseEGCP4820.save!

courseEGEE2010 = Course.new;
courseEGEE2010.designator = "EGEE-2010";
courseEGEE2010.name = "Circuits";
courseEGEE2010.credits = 3;
courseEGEE2010.description = "how do i get there?";
courseEGEE2010.save!

courseEGEE3210 = Course.new;
courseEGEE3210.designator = "EGEE-3210";
courseEGEE3210.name = "Electronics I";
courseEGEE3210.credits = 3;
courseEGEE3210.description = "basic electronics";
courseEGEE3210.save!

courseEGGN1010 = Course.new;
courseEGGN1010.designator = "EGGN-1010";
courseEGGN1010.name = "The Engineering Profession";
courseEGGN1010.credits = 2;
courseEGGN1010.description = "cardboard canoe race";
courseEGGN1010.save!

courseEGGN3110 = Course.new;
courseEGGN3110.designator = "EGGN-3110";
courseEGGN3110.name = "Professional Ethics";
courseEGGN3110.credits = 3;
courseEGGN3110.description = "Politicians course";
courseEGGN3110.save!

courseEGME1010 = Course.new;
courseEGME1010.designator = "EGME-1010";
courseEGME1010.name = "Engineering Graphics";
courseEGME1010.credits = 2;
courseEGME1010.description = "engineers as artists";
courseEGME1010.save!

courseMATH1710 = Course.new;
courseMATH1710.designator = "MATH-1710";
courseMATH1710.name = "Calculus I";
courseMATH1710.credits = 5;
courseMATH1710.description = "weedout course";
courseMATH1710.save!

courseMATH1720 = Course.new;
courseMATH1720.designator = "MATH-1720";
courseMATH1720.name = "Calculus II";
courseMATH1720.credits = 5;
courseMATH1720.description = "for those who survuved calc 1";
courseMATH1720.save!

courseMATH2520 = Course.new;
courseMATH2520.designator = "MATH-2520";
courseMATH2520.name = "Discrete Math";
courseMATH2520.credits = 3;
courseMATH2520.description = "We should always be discrete";
courseMATH2520.save!

courseMATH3500 = Course.new;
courseMATH3500.designator = "MATH-3500";
courseMATH3500.name = "Number Theory";
courseMATH3500.credits = 3;
courseMATH3500.description = "Why??";
courseMATH3500.save!

courseMATH3600 = Course.new;
courseMATH3600.designator = "MATH-3600";
courseMATH3600.name = "Linear Algebra";
courseMATH3600.credits = 3;
courseMATH3600.description = "as opposed to non-linear";
courseMATH3600.save!

coursePHYS2110 = Course.new;
coursePHYS2110.designator = "PHYS-2110";
coursePHYS2110.name = "Physics I";
coursePHYS2110.credits = 4;
coursePHYS2110.description = "Distance, Velocity, Acceleration";
coursePHYS2110.save!

coursePHYS2210 = Course.new;
coursePHYS2210.designator = "PHYS-2210";
coursePHYS2210.name = "Physics II";
coursePHYS2210.credits = 4;
coursePHYS2210.description = "more Distance, Velocity, Acceleration";
coursePHYS2210.save!

#create plans
planCS19 = Plan.new;
planCS19.name = "Comp_Sci_2019_catalog"
planCS19.user_id = userCS.id;
planCS19.major_id = majorCS.id;
planCS19.catalog_id = catalog1.id;
planCS19.save!

planCS20 = Plan.new;
planCS20.name = "Comp_Sci_2020_catalog"
planCS20.user_id = userCS.id;
planCS20.major_id = majorCS.id;
planCS20.catalog_id = catalog2.id;
planCS20.save!

planCPE19 = Plan.new;
planCPE19.name = "Comp_Eng_2019_catalog"
planCPE19.user_id = userCPE.id;
planCPE19.major_id = majorCPE.id;
planCPE19.catalog_id = catalog1.id;
planCPE19.save!

# create plan_courses
PlanCourse.create(plan_id: planCS19.id, course_id: courseEGCP1010.id, term: "Fall", year: 2019)
PlanCourse.create(plan_id: planCS19.id, course_id: courseBTGE1000.id, term: "Fall", year: 2019)
PlanCourse.create(plan_id: planCS19.id, course_id: courseMATH1710.id, term: "Fall", year: 2019)
PlanCourse.create(plan_id: planCS19.id, course_id: courseCS1210.id, term: "Fall", year: 2019)
PlanCourse.create(plan_id: planCS19.id, course_id: coursePHYS2210.id, term: "Fall", year: 2020)
PlanCourse.create(plan_id: planCS19.id, course_id: courseEGCP2120.id, term: "Fall", year: 2020)
PlanCourse.create(plan_id: planCS19.id, course_id: courseCS2210.id, term: "Fall", year: 2020)
PlanCourse.create(plan_id: planCS19.id, course_id: courseMATH2520.id, term: "Fall", year: 2020)
PlanCourse.create(plan_id: planCS19.id, course_id: courseEGEE2010.id, term: "Spring", year: 2020)
PlanCourse.create(plan_id: planCS19.id, course_id: courseCS1220.id, term: "Spring", year: 2020)
PlanCourse.create(plan_id: planCS19.id, course_id: courseMATH1720.id, term: "Spring", year: 2020)
PlanCourse.create(plan_id: planCS19.id, course_id: coursePHYS2110.id, term: "Spring", year: 2020)
PlanCourse.create(plan_id: planCS19.id, course_id: courseCHEM1050.id, term: "Summer", year: 2020)
PlanCourse.create(plan_id: planCS19.id, course_id: courseEGCP3210.id, term: "Fall", year: 2021)
PlanCourse.create(plan_id: planCS19.id, course_id: courseCS4330.id, term: "Fall", year: 2021)
PlanCourse.create(plan_id: planCS19.id, course_id: courseCS3310.id, term: "Fall", year: 2021)
PlanCourse.create(plan_id: planCS19.id, course_id: courseCS3410.id, term: "Fall", year: 2021)
PlanCourse.create(plan_id: planCS19.id, course_id: courseEGCP3010.id, term: "Spring", year: 2021)
PlanCourse.create(plan_id: planCS19.id, course_id: courseMATH3500.id, term: "Spring", year: 2021)
PlanCourse.create(plan_id: planCS19.id, course_id: courseCS3510.id, term: "Spring", year: 2021)
PlanCourse.create(plan_id: planCS19.id, course_id: courseEGME1010.id, term: "Spring", year: 2021)
PlanCourse.create(plan_id: planCS19.id, course_id: courseMATH3600.id, term: "Summer", year: 2021)
PlanCourse.create(plan_id: planCS19.id, course_id: courseEGCP4310.id, term: "Fall", year: 2022)
PlanCourse.create(plan_id: planCS19.id, course_id: courseCS4710.id, term: "Fall", year: 2022)
PlanCourse.create(plan_id: planCS19.id, course_id: courseEGEE3210.id, term: "Fall", year: 2022)
PlanCourse.create(plan_id: planCS19.id, course_id: courseEGCP4210.id, term: "Spring", year: 2022)
PlanCourse.create(plan_id: planCS19.id, course_id: courseCS3520.id, term: "Spring", year: 2022)
PlanCourse.create(plan_id: planCS19.id, course_id: courseCS3220.id, term: "Spring", year: 2022)
PlanCourse.create(plan_id: planCS19.id, course_id: courseCS3610.id, term: "Spring", year: 2022)
PlanCourse.create(plan_id: planCS19.id, course_id: courseCY4310.id, term: "Spring", year: 2023)
PlanCourse.create(plan_id: planCS19.id, course_id: courseCS4410.id, term: "Spring", year: 2023)
PlanCourse.create(plan_id: planCS19.id, course_id: courseEGGN3110.id, term: "Spring", year: 2023)
PlanCourse.create(plan_id: planCS19.id, course_id: courseCS4820.id, term: "Spring", year: 2023)
PlanCourse.create(plan_id: planCS20.id, course_id: courseBTGE1000.id, term: "Fall", year: 2019)
PlanCourse.create(plan_id: planCS20.id, course_id: courseMATH1710.id, term: "Fall", year: 2019)
PlanCourse.create(plan_id: planCS20.id, course_id: courseCS1210.id, term: "Fall", year: 2019)
PlanCourse.create(plan_id: planCS20.id, course_id: courseEGCP1010.id, term: "Fall", year: 2019)
PlanCourse.create(plan_id: planCS20.id, course_id: courseEGCP2120.id, term: "Fall", year: 2020)
PlanCourse.create(plan_id: planCS20.id, course_id: courseMATH2520.id, term: "Fall", year: 2020)
PlanCourse.create(plan_id: planCS20.id, course_id: courseCS2210.id, term: "Fall", year: 2020)
PlanCourse.create(plan_id: planCS20.id, course_id: coursePHYS2210.id, term: "Fall", year: 2020)
PlanCourse.create(plan_id: planCS20.id, course_id: courseCS1220.id, term: "Spring", year: 2020)
PlanCourse.create(plan_id: planCS20.id, course_id: coursePHYS2110.id, term: "Spring", year: 2020)
PlanCourse.create(plan_id: planCS20.id, course_id: courseEGEE2010.id, term: "Spring", year: 2020)
PlanCourse.create(plan_id: planCS20.id, course_id: courseMATH1720.id, term: "Spring", year: 2020)
PlanCourse.create(plan_id: planCS20.id, course_id: courseCHEM1050.id, term: "Summer", year: 2020)
PlanCourse.create(plan_id: planCS20.id, course_id: courseEGCP3210.id, term: "Fall", year: 2021)
PlanCourse.create(plan_id: planCS20.id, course_id: courseCY3210.id, term: "Fall", year: 2021)
PlanCourse.create(plan_id: planCS20.id, course_id: courseCS3410.id, term: "Fall", year: 2021)
PlanCourse.create(plan_id: planCS20.id, course_id: courseCS3410.id, term: "Fall", year: 2021)
PlanCourse.create(plan_id: planCS20.id, course_id: courseEGCP3210.id, term: "Fall", year: 2021)
PlanCourse.create(plan_id: planCS20.id, course_id: courseMATH3500.id, term: "Spring", year: 2021)
PlanCourse.create(plan_id: planCS20.id, course_id: courseEGME1010.id, term: "Spring", year: 2021)
PlanCourse.create(plan_id: planCS20.id, course_id: courseCY2210.id, term: "Spring", year: 2021)
PlanCourse.create(plan_id: planCS20.id, course_id: courseEGCP3010.id, term: "Spring", year: 2021)
PlanCourse.create(plan_id: planCS20.id, course_id: courseMATH3600.id, term: "Summer", year: 2021)
PlanCourse.create(plan_id: planCS20.id, course_id: courseEGCP4310.id, term: "Fall", year: 2022)
PlanCourse.create(plan_id: planCS20.id, course_id: courseCS4810.id, term: "Fall", year: 2022)
PlanCourse.create(plan_id: planCS20.id, course_id: courseEGEE3210.id, term: "Fall", year: 2022)
PlanCourse.create(plan_id: planCS20.id, course_id: courseCS4710.id, term: "Fall", year: 2022)
PlanCourse.create(plan_id: planCS20.id, course_id: courseCS3520.id, term: "Spring", year: 2022)
PlanCourse.create(plan_id: planCS20.id, course_id: courseCS3610.id, term: "Spring", year: 2022)
PlanCourse.create(plan_id: planCS20.id, course_id: courseEGCP4210.id, term: "Spring", year: 2022)
PlanCourse.create(plan_id: planCS20.id, course_id: courseCS3220.id, term: "Spring", year: 2022)
PlanCourse.create(plan_id: planCS20.id, course_id: courseEGGN3110.id, term: "Spring", year: 2023)
PlanCourse.create(plan_id: planCS20.id, course_id: courseCS4410.id, term: "Spring", year: 2023)
PlanCourse.create(plan_id: planCS20.id, course_id: courseCY4310.id, term: "Spring", year: 2023)
PlanCourse.create(plan_id: planCS20.id, course_id: courseCS4820.id, term: "Spring", year: 2023)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseBTGE1000.id, term: "Fall", year: 2019)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseMATH1710.id, term: "Fall", year: 2019)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseEGGN1010.id, term: "Fall", year: 2019)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseEGCP1010.id, term: "Fall", year: 2019)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseEGCP2120.id, term: "Fall", year: 2020)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseCS1220.id, term: "Fall", year: 2020)
PlanCourse.create(plan_id: planCPE19.id, course_id: coursePHYS2110.id, term: "Fall", year: 2020)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseMATH1710.id, term: "Spring", year: 2020)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseCS1210.id, term: "Spring", year: 2020)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseCHEM1050.id, term: "Spring", year: 2020)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseCS3310.id, term: "Spring", year: 2020)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseEGME1010.id, term: "Summer", year: 2020)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseEGEE3210.id, term: "Fall", year: 2021)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseCS3220.id, term: "Fall", year: 2021)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseCY4310.id, term: "Fall", year: 2021)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseEGCP3010.id, term: "Fall", year: 2021)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseCS3610.id, term: "Spring", year: 2021)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseCS2210.id, term: "Spring", year: 2021)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseCS3520.id, term: "Spring", year: 2021)
PlanCourse.create(plan_id: planCPE19.id, course_id: coursePHYS2210.id, term: "Spring", year: 2021)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseCS3510.id, term: "Summer", year: 2021)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseEGCP4810.id, term: "Fall", year: 2022)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseMATH3500.id, term: "Fall", year: 2022)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseCS4710.id, term: "Fall", year: 2022)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseMATH3600.id, term: "Fall", year: 2022)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseCY2210.id, term: "Spring", year: 2022)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseMATH2520.id, term: "Spring", year: 2022)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseCS4410.id, term: "Spring", year: 2022)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseEGCP3210.id, term: "Spring", year: 2022)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseCS4330.id, term: "Summer", year: 2022)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseEGGN3110.id, term: "Spring", year: 2023)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseEGCP4210.id, term: "Spring", year: 2023)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseEGCP4310.id, term: "Spring", year: 2023)
PlanCourse.create(plan_id: planCPE19.id, course_id: courseEGCP4820.id, term: "Spring", year: 2023)

# create catalog_courses
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseBTGE1000.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseBTGE1000.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseCHEM1050.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCHEM1050.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseCS1210.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCS1210.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseCS1220.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCS1220.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseCS2210.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCS2210.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseCS3220.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCS3220.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseCS3310.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCS3310.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseCS3410.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCS3410.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseCS3510.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseCS3520.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCS3520.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseCS3610.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCS3610.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseCS4330.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCS4330.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseCS4410.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCS4410.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseCS4710.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCS4710.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseCS4810.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCS4810.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseCS4820.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCS4820.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCY2210.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCY3210.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseCY4310.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseCY4310.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseEGCP1010.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseEGCP1010.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseEGCP2120.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseEGCP2120.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseEGCP3010.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseEGCP3010.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseEGCP3210.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseEGCP3210.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseEGCP4210.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseEGCP4210.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseEGCP4310.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseEGCP4310.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseEGCP4810.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseEGCP4810.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseEGCP4820.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseEGCP4820.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseEGEE2010.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseEGEE2010.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseEGEE3210.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseEGEE3210.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseEGGN1010.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseEGGN1010.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseEGGN3110.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseEGGN3110.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseEGME1010.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseEGME1010.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseMATH1710.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseMATH1710.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseMATH1720.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseMATH1720.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseMATH2520.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseMATH2520.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseMATH3500.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseMATH3500.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: courseMATH3600.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: courseMATH3600.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: coursePHYS2110.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: coursePHYS2110.id);
CatalogCourse.create(catalog_id: catalog1.id, course_id: coursePHYS2210.id);
CatalogCourse.create(catalog_id: catalog2.id, course_id: coursePHYS2210.id);


# create category_courses
CategoryCourse.create(category_id: catCScore1.id, course_id: courseCS1210.id);
CategoryCourse.create(category_id: catCScore1.id, course_id: courseCS1220.id);
CategoryCourse.create(category_id: catCScore1.id, course_id: courseCS2210.id);
CategoryCourse.create(category_id: catCScore1.id, course_id: courseCS3220.id);
CategoryCourse.create(category_id: catCScore1.id, course_id: courseCS3310.id);
CategoryCourse.create(category_id: catCScore1.id, course_id: courseCS3410.id);
CategoryCourse.create(category_id: catCScore1.id, course_id: courseCS3510.id);
CategoryCourse.create(category_id: catCScore1.id, course_id: courseCS3520.id);
CategoryCourse.create(category_id: catCScore1.id, course_id: courseCS3610.id);
CategoryCourse.create(category_id: catCScore1.id, course_id: courseCS4810.id);
CategoryCourse.create(category_id: catCScore1.id, course_id: courseCS4820.id);
CategoryCourse.create(category_id: catCScore1.id, course_id: courseEGCP1010.id);
CategoryCourse.create(category_id: catCScore1.id, course_id: courseEGGN3110.id);
CategoryCourse.create(category_id: catCScore1.id, course_id: courseMATH2520.id);
CategoryCourse.create(category_id: catCScognates1.id, course_id: courseCHEM1050.id);
CategoryCourse.create(category_id: catCScognates1.id, course_id: courseMATH1710.id);
CategoryCourse.create(category_id: catCScognates1.id, course_id: courseMATH1720.id);
CategoryCourse.create(category_id: catCScognates1.id, course_id: coursePHYS2110.id);
CategoryCourse.create(category_id: catCScognates1.id, course_id: coursePHYS2210.id);
CategoryCourse.create(category_id: catCSelectives1.id, course_id: courseCS4330.id);
CategoryCourse.create(category_id: catCSelectives1.id, course_id: courseCS4410.id);
CategoryCourse.create(category_id: catCSelectives1.id, course_id: courseCS4710.id);
CategoryCourse.create(category_id: catCSelectives1.id, course_id: courseEGCP4310.id);
CategoryCourse.create(category_id: catCSelectives1.id, course_id: courseMATH3500.id);
CategoryCourse.create(category_id: catCSelectives1.id, course_id: courseMATH3600.id);

CategoryCourse.create(category_id: catCScore2.id, course_id: courseCS1210.id);
CategoryCourse.create(category_id: catCScore2.id, course_id: courseCS1220.id);
CategoryCourse.create(category_id: catCScore2.id, course_id: courseCS2210.id);
CategoryCourse.create(category_id: catCScore2.id, course_id: courseCS3220.id);
CategoryCourse.create(category_id: catCScore2.id, course_id: courseCS3310.id);
CategoryCourse.create(category_id: catCScore2.id, course_id: courseCS3410.id);
CategoryCourse.create(category_id: catCScore2.id, course_id: courseCS3520.id);
CategoryCourse.create(category_id: catCScore2.id, course_id: courseCS3610.id);
CategoryCourse.create(category_id: catCScore2.id, course_id: courseCS4810.id);
CategoryCourse.create(category_id: catCScore2.id, course_id: courseCS4820.id);
CategoryCourse.create(category_id: catCScore2.id, course_id: courseCY2210.id);
CategoryCourse.create(category_id: catCScore2.id, course_id: courseCY3210.id);
CategoryCourse.create(category_id: catCScore2.id, course_id: courseEGCP1010.id);
CategoryCourse.create(category_id: catCScore2.id, course_id: courseEGGN3110.id);
CategoryCourse.create(category_id: catCScognates2.id, course_id: courseMATH2520.id);
CategoryCourse.create(category_id: catCScognates2.id, course_id: courseMATH1710.id);
CategoryCourse.create(category_id: catCScognates2.id, course_id: courseMATH1720.id);
CategoryCourse.create(category_id: catCScognates2.id, course_id: coursePHYS2110.id);
CategoryCourse.create(category_id: catCScognates2.id, course_id: coursePHYS2210.id);
CategoryCourse.create(category_id: catCSelectives2.id, course_id: courseCS4330.id);
CategoryCourse.create(category_id: catCSelectives2.id, course_id: courseCS4410.id);
CategoryCourse.create(category_id: catCSelectives2.id, course_id: courseCS4710.id);
CategoryCourse.create(category_id: catCSelectives2.id, course_id: courseEGCP4210.id);
CategoryCourse.create(category_id: catCSelectives2.id, course_id: courseEGCP4310.id);
CategoryCourse.create(category_id: catCSelectives2.id, course_id: courseMATH3500.id);
CategoryCourse.create(category_id: catCSelectives2.id, course_id: courseMATH3600.id);

CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseCS1210.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseCS1220.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseCS2210.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseCS3220.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseEGCP1010.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseEGCP2120.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseEGCP3010.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseEGCP3210.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseEGCP4210.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseEGCP4310.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseEGCP4810.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseEGCP4820.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseEGEE2010.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseEGEE3210.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseEGGN1010.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseEGGN3110.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseEGME1010.id);
CategoryCourse.create(category_id: catCPEcore1.id, course_id: courseMATH2520.id);
CategoryCourse.create(category_id: catCPEcognates1.id, course_id: courseCHEM1050.id);
CategoryCourse.create(category_id: catCPEcognates1.id, course_id: courseMATH1710.id);
CategoryCourse.create(category_id: catCPEcognates1.id, course_id: courseMATH1720.id);
CategoryCourse.create(category_id: catCPEcognates1.id, course_id: courseMATH3600.id);
CategoryCourse.create(category_id: catCPEcognates1.id, course_id: coursePHYS2110.id);
CategoryCourse.create(category_id: catCPEcognates1.id, course_id: coursePHYS2210.id);

CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseCS1210.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseCS1220.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseCS2210.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseCS3220.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseCY2210.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseEGCP1010.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseEGCP2120.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseEGCP3010.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseEGCP3210.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseEGCP4210.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseEGCP4310.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseEGCP4810.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseEGCP4820.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseEGEE2010.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseEGEE3210.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseEGGN1010.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseEGGN3110.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseEGME1010.id);
CategoryCourse.create(category_id: catCPEcore2.id, course_id: courseMATH2520.id);
CategoryCourse.create(category_id: catCPEcognates2.id, course_id: courseCHEM1050.id);
CategoryCourse.create(category_id: catCPEcognates2.id, course_id: courseMATH1710.id);
CategoryCourse.create(category_id: catCPEcognates2.id, course_id: courseMATH1720.id);
CategoryCourse.create(category_id: catCPEcognates2.id, course_id: courseMATH3600.id);
CategoryCourse.create(category_id: catCPEcognates2.id, course_id: coursePHYS2110.id);
CategoryCourse.create(category_id: catCPEcognates2.id, course_id: coursePHYS2210.id);

#create users pete and joe
user1 = User.new
user1.login = "joe"
user1.email = "joe@cedarville.edu"
user1.password = "password"
user1.password_confirmation = "password"
user1.save!

user2 = User.new
user2.login = "pete"
user2.email = "pete@cedarville.edu"
user2.password = "password"
user2.password_confirmation = "password"
user2.save!

#give joe a couple of plans
plan1 = Plan.new
plan1.name = "Plan1"
plan1.user_id = user1.id
plan1.save!

plan2 = Plan.new
plan2.name = "Plan2"
plan2.user_id = user1.id
plan2.save!

course1 = Course.new
course1.name = "CS-1210"
course1.save!

course2 = Course.new
course2.name = "CS-1220"
course2.save!

PlanCourse.create(plan_id: plan1.id, course_id: course1.id, year: 2023 , term: "Fall")
PlanCourse.create(plan_id: plan1.id, course_id: course2.id, year: 2024 , term: "Spring")

#alternate syntax
#Plan.create(user_id: user1.id, name: "Plan1")
#Plan.create(user_id: user1.id, name: "Plan2")
