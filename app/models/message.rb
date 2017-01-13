class Message < ActiveRecord::Base
#model's name is always singular and start from upper case letter
#ActiveRecord::Baseというクラスを継承することで、DBのTableを利用可能
#Message modelとはMessage Class

    #名前は必須入力かつ20文字以内
    validates :name, length:{maximum: 20}, presence: true

    #内容は必須入力かつ2文字以上30文字以下
    validates :body, length:{minimum: 2, maximum: 30}, presence: true
end
