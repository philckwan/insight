class ValuesPage
  include PageObject

  page_url = 'C:/Users/Philip/RubymineProjects/insight/insight.html' # for internal/offline testing

  label(:label1, :id => "lbl_val_1")
  label(:label2, :id => "lbl_val_2")
  label(:label3, :id => "lbl_val_3")
  label(:label4, :id => "lbl_val_4")
  label(:label5, :id => "lbl_val_5")
  label(:label_total, :id => "lbl_ttl_val")

  text_field(:input1, :id => 'txt_val_1')
  text_field(:input2, :id => 'txt_val_2')
  text_field(:input3, :id => 'txt_val_3')
  text_field(:input4, :id => 'txt_val_4')
  text_field(:input5, :id => 'txt_val_5')
  text_field(:input_total, :id => 'txt_ttl_val')
end