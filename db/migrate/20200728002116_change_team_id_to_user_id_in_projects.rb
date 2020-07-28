class ChangeTeamIdToUserIdInProjects < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :team_id, :user_id
  end
end
