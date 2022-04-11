json.requirement do
  json.categories @requirement.category do |category|
    json.courses @category.courses do |courses|
        json.designator course.designator
    end
  end
end
