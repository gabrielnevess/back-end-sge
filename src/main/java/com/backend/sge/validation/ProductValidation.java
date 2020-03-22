package com.backend.sge.validation;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
@EqualsAndHashCode
@ToString
public class ProductValidation {

    @NotBlank(message = "nome do produto é obrigatório")
    @Size(min = 3, max = 255, message = "nome do produto deve ser igual ou superior a 3 caracteres e menor que 255 caracteres")
    private String name;

    @NotNull(message = "estoque mínimo é obrigatório")
    @PositiveOrZero(message = "estoque mínimo não pode ser negativo")
    private Integer minStock;

    @NotNull(message = "estoque máximo é obrigatório")
    @PositiveOrZero(message = "estoque máximo não pode ser negativo")
    private Integer maxStock;

    @NotNull(message = "status é obrigatório")
    private Boolean status;

}