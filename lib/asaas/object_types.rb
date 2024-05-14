# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength

module Asaas
  module ObjectTypes
    def self.object_names_to_classes
      {
        # data structures
        ListObject::OBJECT_NAME => ListObject,
        SearchResultObject::OBJECT_NAME => SearchResultObject,

        # business objects
        Account::OBJECT_NAME => Account,
        AccountLink::OBJECT_NAME => AccountLink,
        AccountSession::OBJECT_NAME => AccountSession,
        ApplePayDomain::OBJECT_NAME => ApplePayDomain,
        ApplicationFee::OBJECT_NAME => ApplicationFee,
        ApplicationFeeRefund::OBJECT_NAME => ApplicationFeeRefund,
        Balance::OBJECT_NAME => Balance,
        BalanceTransaction::OBJECT_NAME => BalanceTransaction,
        BankAccount::OBJECT_NAME => BankAccount,
        Capability::OBJECT_NAME => Capability,
        Card::OBJECT_NAME => Card,
        CashBalance::OBJECT_NAME => CashBalance,
        Charge::OBJECT_NAME => Charge,
        Installment::OBJECT_NAME => Installment,
        CountrySpec::OBJECT_NAME => CountrySpec,
        Coupon::OBJECT_NAME => Coupon,
        CreditNote::OBJECT_NAME => CreditNote,
        CreditNoteLineItem::OBJECT_NAME => CreditNoteLineItem,
        Customer::OBJECT_NAME => Customer,
        CustomerBalanceTransaction::OBJECT_NAME => CustomerBalanceTransaction,
        CustomerCashBalanceTransaction::OBJECT_NAME => CustomerCashBalanceTransaction,
        Discount::OBJECT_NAME => Discount,
        Dispute::OBJECT_NAME => Dispute,
        EphemeralKey::OBJECT_NAME => EphemeralKey,
        Event::OBJECT_NAME => Event,
        ExchangeRate::OBJECT_NAME => ExchangeRate,
        FileLink::OBJECT_NAME => FileLink,
        FundingInstructions::OBJECT_NAME => FundingInstructions,
        Invoice::OBJECT_NAME => Invoice,
        InvoiceItem::OBJECT_NAME => InvoiceItem,
        InvoiceLineItem::OBJECT_NAME => InvoiceLineItem,
        LineItem::OBJECT_NAME => LineItem,
        LoginLink::OBJECT_NAME => LoginLink,
        Mandate::OBJECT_NAME => Mandate,
        PaymentIntent::OBJECT_NAME => PaymentIntent,
        PaymentLink::OBJECT_NAME => PaymentLink,
        PaymentMethod::OBJECT_NAME => PaymentMethod,
        PaymentMethodConfiguration::OBJECT_NAME => PaymentMethodConfiguration,
        PaymentMethodDomain::OBJECT_NAME => PaymentMethodDomain,
        Payout::OBJECT_NAME => Payout,
        Person::OBJECT_NAME => Person,
        Plan::OBJECT_NAME => Plan,
        Price::OBJECT_NAME => Price,
        Product::OBJECT_NAME => Product,
        PromotionCode::OBJECT_NAME => PromotionCode,
        Refund::OBJECT_NAME => Refund,
        Reversal::OBJECT_NAME => Reversal,
        Review::OBJECT_NAME => Review,
        SetupAttempt::OBJECT_NAME => SetupAttempt,
        SetupIntent::OBJECT_NAME => SetupIntent,
        ShippingRate::OBJECT_NAME => ShippingRate,
        Source::OBJECT_NAME => Source,
        SourceTransaction::OBJECT_NAME => SourceTransaction,
        Subscription::OBJECT_NAME => Subscription,
        SubscriptionItem::OBJECT_NAME => SubscriptionItem,
        SubscriptionSchedule::OBJECT_NAME => SubscriptionSchedule,
        TaxCode::OBJECT_NAME => TaxCode,
        TaxId::OBJECT_NAME => TaxId,
        TaxRate::OBJECT_NAME => TaxRate,
        Token::OBJECT_NAME => Token,
        Topup::OBJECT_NAME => Topup,
        Transfer::OBJECT_NAME => Transfer,
        UsageRecord::OBJECT_NAME => UsageRecord,
        UsageRecordSummary::OBJECT_NAME => UsageRecordSummary,
        WebhookEndpoint::OBJECT_NAME => WebhookEndpoint,
      }
    end
  end
end

# rubocop:enable Metrics/MethodLength
