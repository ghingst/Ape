json.plans @plans do |plan|

    json.catalog_year 
    json.course_id 

    json.plan_name plan.name
    json.major @major.name
    json.first_name  @user.first_name
    json.last_name  @user.last_name
    json.requirement_id @requirement.id
    json.courses plan.plan_courses do |planCourse|
      json.designator planCourse.course.designator
      json.year planCourse.year
      json.term planCourse.term
    end

    json.catalog do

        json.year @catalog.year
        json.courses @catalog.courses do |course|
          json.designator course.designator
          json.name course.name
          json.credit course.credits
          json.description course.description
        end

    end

end







