json.categories @requirement.categories do |category|
  json.name category.name
  json.courses category.courses do |course|
      json.designator course.designator
      json.title course.name
  end
end

