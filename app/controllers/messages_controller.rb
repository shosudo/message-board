class MessagesController < ApplicationController
#ApplicationControllerというクラスを継承しているため、アクションに対応したviewを表示可能となる。 
#ここで対応しているのは views/messages/index.html
#Controllerの名前の最後の部分は複数形にする. ex) ClientsController, SiteAdminsController
  
  before_action :set_message, only: [:edit, :update]
  #:edit,#updateのアクションの実行前に、set_message methodを行う
  
  def index
    @message = Message.new
    #@--- = インスタンス変数
    #Messageモデルのオブジェクトの初期化を行い、@messageに代入
    
    @messages = Message.all
    #Get all messages
  end
  
  def create
    @message = Message.new(message_params)
    #message_paramsの内容をもとに、Messageモデルのインスタンスを生成し、変数@messageに代入
    
    if @message.save
      redirect_to root_path, notice:'メッセージを保存しました'
    else
      #Validationに引っかかり、Messageの保存に失敗した場合
      @messages = Message.all
      #Templateに利用するMessage.allを@messagesに渡す
      flash.now[:alert] = "Failed to save message"
      #エラーメッセージをflash.now[:alert]に代入
      #エラーメッセージの内容はどこで設定されている??? validationはmessage.rbだが。
      #messageのcssはmessages.scssで設定
      render 'index'
    end
  end
  
  def edit
  end
  
  def update
    if @message.update(message_params)
      #保存に成功した場合はTOPへリダイレクト
      redirect_to root_path, notice: 'Edit the Message'
    else
      #失敗した場合は編集画面へ
      render 'edit'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name,:body)
  end
  
  def set_message
    # @mmesageに編集しようとする投稿の内容をセット ??? params[:id] => URLで入力された@messageのparameter idが入力される
    @message = Message.find(params[:id])
  end
end
