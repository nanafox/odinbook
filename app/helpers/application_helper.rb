module ApplicationHelper
  def make_title(title)
    "#{title} | OdinBook"
  end

  def border_separator_color
    "border-slate-700"
  end

  # Builds a profile image with the user's first and last names
  def fallback_avatar_for(user)
    user.name.split(" ").map { |n| n[0] }.join
  end
end
