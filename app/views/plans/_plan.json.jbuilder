json.plan do
  json.id @plan.id
  json.major @major.name
  json.user @plan.user_id
  json.courses @plan.plan_courses do |planCourse|
    json.designator planCourse.course.designator
    json.year planCourse.year
    json.term planCourse.term
  end

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



