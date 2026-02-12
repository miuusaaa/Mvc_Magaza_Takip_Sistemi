using System;
using System.Globalization;
using System.Web.Mvc;

public class DecimalModelBinder : IModelBinder
{
    public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
    {
        var valueResult = bindingContext.ValueProvider.GetValue(bindingContext.ModelName);

        if (valueResult == null)
            return null;

        var value = valueResult.AttemptedValue;

        if (string.IsNullOrWhiteSpace(value))
            return null;

        // Hem , hem . normalize ediliyor
        value = value.Replace(",", ".");

        decimal result;
        if (!decimal.TryParse(value, NumberStyles.Any, CultureInfo.InvariantCulture, out result))
        {
            bindingContext.ModelState.AddModelError(
                bindingContext.ModelName,
                "Geçerli bir sayı giriniz (örn: 123,45 veya 123.45)");
            return null;
        }

        return result;
    }
}
