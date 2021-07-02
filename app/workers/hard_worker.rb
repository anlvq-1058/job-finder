class HardWorker
  include Sidekiq::Worker

  def perform(method, resume)
    binding.pry
    UserApplyMailer.send(method, resume).deliver_now
  end
end
