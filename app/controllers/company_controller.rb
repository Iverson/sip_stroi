class CompanyController < ApplicationController
  def about
  end

  def certificates
    @certificates = Certificate.positioned
  end

  def partners
    @partners = Partner.positioned
  end

  def projection
  end

  def domokomplekty
  end

  def osp
  end

  def esp
  end

  def offices
    @offices = Office.positioned
  end

  def contacts
  end
end
