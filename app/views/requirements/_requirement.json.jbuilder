json.categories @requirement.categories do |category|
  json.courses category.courses do |course|
      json.designator course.designator
  end
end

