#Copyright (C) 2017  Alexandre BOUDINE
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'redmine'

class Hook < Redmine::Hook::ViewListener
	render_on :view_settings_general_form, :partial => 'settings/macro_button'
end

#Add a macro named group
Redmine::WikiFormatting::Macros.register do
	desc "Only group members will see the text. Example:\n\n{{group(MyGroup)\nSomeText\n}}"
	macro :group do |obj, args, text|
		the_group = Group.all.where("id IN (SELECT id FROM users WHERE type = 'Group' AND lastname = '"+args.first.to_s+"')")
		if the_group.size >= 1 then
			the_group = the_group.first
			if User.current.group_ids.include?(the_group.id) then
				out = textilizable(text)
			else
				out = ''.html_safe
			end
		else
			out = (l(:no_such_group_error)+" : "+args.first.to_s).html_safe
		end
		out
	end
end