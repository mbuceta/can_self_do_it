require 'can_do_it/base'
module CanDoIt
module Unknown

include CanDoIt::Base

protected

  def can_see_default?(obj);        true;  end

  def can_edit_default?(obj);       can_modify_default?(obj); end

  def can_create_default?(parent);  can_modify_default?(parent); end

  def can_delete_default?(obj);     can_modify_default?(obj); end

  def can_modify_default?(obj);     false; end


end
end
