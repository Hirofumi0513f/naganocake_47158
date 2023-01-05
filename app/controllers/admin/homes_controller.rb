class Admin::HomesController < ApplicationController
    # ↓管理者ユーザーのみにアクセスを許可する
  before_action :authenticate_admin!

  def top
  end
end
