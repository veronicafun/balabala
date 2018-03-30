class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    # change是定义要对数据库坐什么
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
      # t.timestamps是个特殊的，他会自动创建create_at和updated_at两列
      # 分别记录创建用户的时间戳和更新用户的时间戳
      
    end
  end
end
