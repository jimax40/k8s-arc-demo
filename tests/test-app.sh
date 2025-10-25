#!/bin/bash
echo "🧪 Ejecutando tests básicos..."

# Test 1: Verificar que responde
echo "Test 1: Conectividad básica"
if curl -f http://localhost:80 > /dev/null 2>&1; then
    echo "✅ App responde correctamente"
else
    echo "❌ App no responde"
    exit 1
fi

# Test 2: Verificar código de respuesta
echo "Test 2: Código de respuesta"
STATUS=$(curl -o /dev/null -s -w "%{http_code}" http://localhost:80)
if [ "$STATUS" = "200" ]; then
    echo "✅ Código HTTP correcto (200)"
else
    echo "❌ Código HTTP incorrecto: $STATUS"
    exit 1
fi

# Test 3: Verificar contenido básico
echo "Test 3: Contenido básico"
if curl -s http://localhost:80 | grep -i "nginx\|welcome" > /dev/null; then
    echo "✅ Contenido esperado encontrado"
else
    echo "❌ Contenido no encontrado"
    exit 1
fi

echo "🎉 Todos los tests pasaron!"
