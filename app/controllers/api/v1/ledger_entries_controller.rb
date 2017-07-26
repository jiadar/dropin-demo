class Api::V1::LedgerEntriesController < ApplicationController
    
  def balance
    u = User.find params[:user_id]
    sum=0
    u.ledger_entries.find_each do |le|
      sum+= le.credit
      sum-= le.debit
    end
    result=Hash.new
    result["balance"] = sum
    render json: result
  end

  private

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:ledger_entry).permit(:user_id, :email, :id)
    end
end

