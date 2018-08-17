ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      panel '최근 이메일 전송 현황' do
        table_for Sendlog.order("id desc").limit(5).each do |_sendlog|
          column 'from_email'
          column 'to_email'
        end
      end
      panel '최근 유저 가입 현황' do
        table_for User.order('id desc').limit(5).each do |_user|
          column 'email'
          column 'name'
        end
      end
    end
    columns do
      panel '최근 주문 현황' do
        '준비중'
      end
    end
  end
end
